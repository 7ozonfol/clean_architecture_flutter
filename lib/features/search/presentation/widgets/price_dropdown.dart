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
    return Consumer<SearchProvider>(builder: (context, provider, child) {
      if (provider.priceList != null) {
        return DropdownButton<int>(
          icon: const Icon(
            Icons.keyboard_arrow_down_sharp,
            size: 32,
            color: Colors.black,
          ),
          isExpanded: true,
          value: provider.selectedPrice,
          items: provider.priceList!.priceList.map((int value) {
            return DropdownMenuItem<int>(
              value: value,
              child: Text(value.toString()),
            );
          }).toList(),
          onChanged: provider.setSelectedPrice,
        ).setHorizontalPadding(context, 0.04);
      } else {
        return const LinearProgressIndicator(
          minHeight: 10,
        ).setHorizontalPadding(context, 0.02);
      }
    });
  }
}
