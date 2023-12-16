import 'package:flutter/material.dart';
import 'package:nawy_task/core/extensions/padding_ext.dart';

class IconWithText extends StatelessWidget {
  const IconWithText({
    super.key,
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Row(
      children: [
        Icon(
          icon,
          size: 21,
        ),
        Text(
          text,
          style: theme.textTheme.bodySmall,
        ).setHorizontalPadding(context, 0.01),
      ],
    );
  }
}
