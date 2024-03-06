import 'package:flutter/material.dart';
import 'package:macros_amounts/constants/spacings.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox.square(
        dimension: Spacing.s48,
        child: CircularProgressIndicator(
          color: Color(0xffED1164),
          strokeWidth: Spacing.s4,
        ),
      ),
    );
  }
}
