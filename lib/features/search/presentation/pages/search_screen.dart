import 'package:flutter/material.dart';
import 'package:nawy_task/core/extensions/padding_ext.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/page_route_names.dart';
import '../providers/search_provider.dart';
import '../widgets/area_searchfield.dart';
import '../widgets/compounds_searchfield.dart';
import '../widgets/price_dropdown.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    final provider = Provider.of<SearchProvider>(context, listen: false);
    provider.getSearchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ///theme is an instance from the app theme Data
    final ThemeData theme = Theme.of(context);

    ///mediaQuery is an instance from the app mediaQuery Data
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Search',
                style: theme.textTheme.bodyLarge,
              ).setHorizontalAndVerticalPadding(context, 0.03, 0.03),
              Text(
                'Area',
                style: theme.textTheme.bodyMedium,
              ).setHorizontalAndVerticalPadding(context, 0.03, 0.01),
              const AreaSearchField(),
              Text(
                'Compound',
                style: theme.textTheme.bodyMedium,
              ).setHorizontalAndVerticalPadding(context, 0.03, 0.01),
              const CompoundSearchField(),
              Text(
                'Price List',
                style: theme.textTheme.bodyMedium,
              ).setHorizontalAndVerticalPadding(context, 0.03, 0.01),
              const PriceDropDown(),
              SizedBox(
                height: mediaQuery.size.height * 0.03,
              ),
              Consumer<SearchProvider>(builder: (context, provider, child) {
                if (provider.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Center(
                    child: TextButton(
                      onPressed: () {
                        provider.getUnitData().then((value) {
                          if (value) {
                            Navigator.pushNamed(
                                context, PageRouteName.resultScreen);
                          }
                        });
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: const BorderSide(color: Colors.blue),
                        ),
                      ),
                      child: Text(
                        'SHOW RESULTS',
                        style: theme.textTheme.bodyMedium!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
