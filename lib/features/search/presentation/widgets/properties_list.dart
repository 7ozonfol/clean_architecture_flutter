import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/skeleton_loading.dart';
import '../providers/search_provider.dart';
import 'unit_card.dart';

class PropertiesList extends StatelessWidget {
  const PropertiesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return Consumer<SearchProvider>(builder: (context, provider, child) {
      if (provider.loading) {
        return ListView.builder(
          itemCount: 8,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            return SkeletonLoading(
                child: Container(
              height: mediaQuery.size.height * 0.61,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ));
          },
        );
      } else {
        return ListView.builder(
          itemCount: provider.unitList.length,
          itemBuilder: (context, i) {
            return UnitCardWidget(unit: provider.unitList[i]);
          },
        );
      }
    });
  }
}
