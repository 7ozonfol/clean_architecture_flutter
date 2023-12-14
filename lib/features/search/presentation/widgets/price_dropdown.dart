import 'package:flutter/material.dart';
import 'package:nawy_task/core/extensions/padding_ext.dart';
import 'package:provider/provider.dart';

import '../providers/search_provider.dart';

class PriceDropDown extends StatelessWidget {
  const PriceDropDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return Consumer<SearchProvider>(builder: (context, provider, child) {
      if (provider.priceList != null) {
        return SizedBox(
          width: mediaQuery.size.width * 0.9,
          child: DropdownButton<int>(
            isExpanded: true,
            value: provider.selectedPrice,
            items: provider.priceList!.priceList.map((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text(value.toString()),
              );
            }).toList(),
            onChanged: provider.setSelectedPrice,
          ),
        ).setHorizontalPadding(context, 0.02);
      }
      return const Center(child: CircularProgressIndicator());
    });
  }
}
