import 'package:flutter/material.dart';

class BillShapeContainerWithText extends StatelessWidget {
  const BillShapeContainerWithText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      margin: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      child: Text(
        text,
        style: theme.textTheme.bodySmall?.copyWith(color: Colors.white),
      ),
    );
  }
}
