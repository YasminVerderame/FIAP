import 'package:flutter/material.dart';
import 'package:macros_amounts/components/text.dart';
import 'package:macros_amounts/constants/spacings.dart';
import 'package:macros_amounts/constants/typographies.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;

  const CustomAppBar({
    super.key,
    required this.title,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xffED1164),
      centerTitle: true,
      elevation: Spacing.s0,
      surfaceTintColor: Colors.transparent,
      title: CustomText(
        text: widget.title,
        color: Colors.white,
        style: TypographyType.header,
      ),
    );
  }
}
