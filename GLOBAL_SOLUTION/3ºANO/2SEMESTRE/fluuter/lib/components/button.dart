import 'package:flutter/material.dart';
import 'package:macros_amounts/components/text.dart';
import 'package:macros_amounts/constants/borders.dart';
import 'package:macros_amounts/constants/spacings.dart';
import 'package:macros_amounts/constants/typographies.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final bool isDisabled;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: OutlinedButton(
        onPressed: isDisabled ? null : onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            isDisabled ? Colors.grey[300] : const Color(0xffED1164),
          ),
          shape: MaterialStateProperty.all(
            shapeBorder(
              isDisabled ? Colors.grey[300]! : const Color(0xffED1164),
            ),
          ),
          side: MaterialStateProperty.all(
            BorderSide(
              width: borderWidth,
              color: isDisabled ? Colors.grey[300]! : const Color(0xffED1164),
            ),
          ),
        ),
        child: _getButtonContent(
          isDisabled ? Colors.black87 : Colors.white,
        ),
      ),
    );
  }

  Widget _getButtonContent(Color contentColor) {
    return SizedBox(
      height: Spacing.s44,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomText(
            color: contentColor,
            style: TypographyType.body,
            text: label.toUpperCase(),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
