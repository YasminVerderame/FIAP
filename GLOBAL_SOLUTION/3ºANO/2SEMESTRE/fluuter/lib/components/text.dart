import 'package:flutter/material.dart';
import 'package:macros_amounts/constants/typographies.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final TypographyType style;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final bool textDecoration;
  final bool wrap;

  const CustomText({
    super.key,
    required this.text,
    required this.style,
    this.color,
    this.textAlign,
    this.textOverflow,
    this.textDecoration = false,
    this.wrap = true,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '-',
      style: typography[style]?.copyWith(
        color: color ?? Colors.black87,
        decoration: textDecoration ? TextDecoration.lineThrough : null,
      ),
      textHeightBehavior: const TextHeightBehavior(
        applyHeightToFirstAscent: true,
        applyHeightToLastDescent: true,
        leadingDistribution: TextLeadingDistribution.even,
      ),
      textAlign: textAlign,
      overflow: textOverflow,
      softWrap: wrap,
    );
  }
}
