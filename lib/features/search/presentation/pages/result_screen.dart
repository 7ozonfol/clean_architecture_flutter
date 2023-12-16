import 'package:flutter/material.dart';
import 'package:nawy_task/core/extensions/padding_ext.dart';

import '../widgets/pill_container_with_text.dart';
import '../widgets/tab_bar_widget.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ///theme is an instance from the app theme Data
    final ThemeData theme = Theme.of(context);

    ///mediaQuery is an instance from the app mediaQuery Data
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon:
                                  const Icon(Icons.arrow_back_ios_new_rounded))
                          .setHorizontalPadding(context, 0.01),
                      Text(
                        'Results',
                        style: theme.textTheme.bodyLarge,
                      ).setVerticalPadding(context, 0.03),
                    ],
                  ),
                  IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.filter_list_alt))
                      .setHorizontalPadding(context, 0.03)
                ],
              ),
              SizedBox(
                height: mediaQuery.size.height * 0.06,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(5),
                  children: const [
                    BillShapeContainerWithText(
                      text: 'City, Governorate',
                    ),
                    BillShapeContainerWithText(
                      text: 'Compound name',
                    ),
                    BillShapeContainerWithText(
                      text: 'Apartment',
                    ),
                    BillShapeContainerWithText(
                      text: 'Apartment',
                    ),
                  ],
                ),
              ),
              const Expanded(child: TabBarWidget())
            ],
          ),
        ),
      ),
    );
  }
}
