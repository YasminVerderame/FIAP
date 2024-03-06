import 'package:flutter/material.dart';
import 'package:macros_amounts/components/text.dart';
import 'package:macros_amounts/constants/typographies.dart';

class CustomEmptyState extends StatelessWidget {
  final String iconPath;
  final String description;

  const CustomEmptyState({
    super.key,
    required this.iconPath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              color: Colors.black87,
              style: TypographyType.body,
              text: description,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
