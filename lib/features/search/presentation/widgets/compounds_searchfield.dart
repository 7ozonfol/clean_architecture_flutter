import 'package:flutter/material.dart';
import 'package:nawy_task/core/extensions/padding_ext.dart';
import 'package:provider/provider.dart';
import 'package:searchfield/searchfield.dart';

import '../../business/entities/compound_entity.dart';
import '../providers/search_provider.dart';

class CompoundSearchField extends StatelessWidget {
  const CompoundSearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ///theme is an instance from the app theme Data
    final ThemeData theme = Theme.of(context);
    return Consumer<SearchProvider>(builder: (context, provider, child) {
      if (provider.loading) {
        return const LinearProgressIndicator(
          minHeight: 10,
        ).setHorizontalPadding(context, 0.02);
      } else {
        return SearchField<CompoundEntity>(
          itemHeight: 50,
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
          suggestions: provider.filteredCompoundList
              .map(
                (e) => SearchFieldListItem<CompoundEntity>(
                  e.name,
                  item: e,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(e.name),
                  ),
                ),
              )
              .toList(),
          onSuggestionTap: (compound) {
            provider.setSelectedCompound(compound.item);
            FocusManager.instance.primaryFocus?.unfocus();
          },
        ).setHorizontalPadding(context, 0.02);
      }
    });
  }
}
