import 'package:flutter/material.dart';
import 'package:macros_amounts/constants/borders.dart';
import 'package:macros_amounts/constants/spacings.dart';

class DropdownDialog extends StatelessWidget {
  final String title;
  final Widget widget;

  const DropdownDialog({
    super.key,
    required this.title,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: borderDialog(Colors.white),
      padding: const EdgeInsets.all(Spacing.s24),
      child: widget,
    );
  }
}
