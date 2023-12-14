import 'package:flutter/material.dart';
import 'package:nawy_task/core/extensions/padding_ext.dart';
import 'package:provider/provider.dart';
import 'package:searchfield/searchfield.dart';

import '../../business/entities/area_entity.dart';
import '../providers/search_provider.dart';

class AreaSearchField extends StatelessWidget {
  const AreaSearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ///theme is an instance from the app theme Data
    final ThemeData theme = Theme.of(context);

    ///mediaQuery is an instance from the app mediaQuery Data
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Consumer<SearchProvider>(builder: (context, provider, child) {
      return SizedBox(
        width: mediaQuery.size.width * 0.9,
        child: SearchField<AreaEntity>(
          searchStyle: theme.textTheme.bodySmall,
          suggestionStyle: theme.textTheme.bodySmall,
          searchInputDecoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.blue,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 1.0),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
          ),
          suggestions: provider.areaList
              .map(
                (e) => SearchFieldListItem<AreaEntity>(
                  e.name,
                  item: e,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(e.name),
                  ),
                ),
              )
              .toList(),
          onSuggestionTap: (area) => provider.setSelectedArea(area.item),
        ),
      ).setHorizontalPadding(context, 0.02);
    });
  }
}
