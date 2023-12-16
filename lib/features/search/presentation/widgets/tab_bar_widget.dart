import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/search_provider.dart';
import 'properties_list.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({
    super.key,
  });

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget>
    with SingleTickerProviderStateMixin {
  late final TabController controllerForTabVarView =
      TabController(length: 2, vsync: this, initialIndex: 0);

  @override
  void initState() {
    final provider = Provider.of<SearchProvider>(context, listen: false);
    provider.getSearchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 1,
                    offset: const Offset(0, 2)),
              ],
            ),
            child: TabBar(controller: controllerForTabVarView, tabs: const [
              Tab(
                text: 'PROPERTIES',
              ),
              Tab(
                text: 'COMPOUNDS',
              ),
            ]),
          ),
          Expanded(
            child: TabBarView(
              controller: controllerForTabVarView,
              children: [
                const PropertiesList(),
                Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
