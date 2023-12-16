import 'package:flutter/material.dart';
import 'package:nawy_task/core/extensions/padding_ext.dart';

class TextButtonWithIcon extends StatelessWidget {
  const TextButtonWithIcon({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        fixedSize: const Size(120, 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: const BorderSide(color: Colors.blue),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 18,
          ),
          Text(
            text,
            style: theme.textTheme.bodyMedium!
                .copyWith(color: Colors.purpleAccent, fontSize: 12),
          ).setHorizontalPadding(context, 0.01),
        ],
      ),
    );
  }
}
