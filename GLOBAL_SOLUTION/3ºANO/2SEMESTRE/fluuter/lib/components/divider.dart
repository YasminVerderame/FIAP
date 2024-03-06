import 'package:flutter/material.dart';
import 'package:macros_amounts/constants/borders.dart';
import 'package:macros_amounts/constants/spacings.dart';

class CustomDivider extends StatelessWidget {
  final Color? color;
  final double height;
  final double width;

  const CustomDivider({
    super.key,
    this.color,
    this.height = Spacing.s0,
    this.width = Spacing.s0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width),
      child: Divider(
        color: color ?? Colors.black26,
        height: height,
        thickness: borderWidth,
      ),
    );
  }
}
