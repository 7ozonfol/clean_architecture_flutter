import 'package:flutter/material.dart';
import 'package:nawy_task/core/extensions/padding_ext.dart';

import '../../business/entities/unit_entity.dart';
import 'icon_with_text.dart';
import 'text_button_with_icon.dart';

class UnitCardWidget extends StatelessWidget {
  const UnitCardWidget({
    super.key,
    required this.unit,
  });
  final UnitEntity unit;

  @override
  Widget build(BuildContext context) {
    ///theme is an instance from the app theme Data
    final ThemeData theme = Theme.of(context);

    ///mediaQuery is an instance from the app mediaQuery Data
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Container(
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
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20), bottom: Radius.zero),
            child: Image.network(
              unit.image,
              height: mediaQuery.size.height * 0.28,
              fit: BoxFit.cover,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return SizedBox(
                  height: mediaQuery.size.height * 0.28,
                  child: const Icon(Icons.image_not_supported),
                );
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    unit.propertyType.name,
                    style: theme.textTheme.bodyMedium,
                  ),
                  Text(
                    'Delivery ${unit.readyByDate.substring(0, 4)}',
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ).setHorizontalAndVerticalPadding(context, 0.03, 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'EGP ${unit.minPrice}',
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: Colors.green, fontSize: 20),
                  ),
                  const Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
                    size: 30,
                  )
                ],
              ).setHorizontalAndVerticalPadding(context, 0.03, 0.01),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '117,493 EGP/month over 7 years',
                    style: theme.textTheme.bodySmall?.copyWith(),
                  ).setVerticalPadding(context, 0.01),
                  Text(
                    unit.compoundDetails.name,
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: Colors.black),
                  ).setVerticalPadding(context, 0.01),
                  Text(
                    '6th October',
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: Colors.black),
                  ).setVerticalPadding(context, 0.01),
                ],
              ).setHorizontalPadding(context, 0.03),
              Container(
                padding: const EdgeInsets.all(10),
                color: Colors.black.withOpacity(0.05),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconWithText(
                      icon: Icons.bed,
                      text: '8',
                    ),
                    IconWithText(
                      icon: Icons.bathtub,
                      text: '8',
                    ),
                    IconWithText(
                      icon: Icons.expand_rounded,
                      text: '8',
                    ),
                  ],
                ),
              ).setVerticalPadding(context, 0.03),
              SizedBox(
                height: mediaQuery.size.height * 0.04,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButtonWithIcon(
                      text: 'Zoom',
                      icon: Icons.video_call_rounded,
                    ),
                    TextButtonWithIcon(
                      text: "Call",
                      icon: Icons.call,
                    ),
                    TextButtonWithIcon(
                      text: 'Whatsapp',
                      icon: Icons.messenger,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
