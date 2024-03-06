import 'package:flutter/material.dart';
import 'package:macros_amounts/components/divider.dart';
import 'package:macros_amounts/components/text.dart';
import 'package:macros_amounts/constants/borders.dart';
import 'package:macros_amounts/constants/spacings.dart';
import 'package:macros_amounts/constants/typographies.dart';
import 'package:macros_amounts/models/macros_model.dart';

class MacrosDialog extends StatelessWidget {
  final MacrosModel? macros;

  const MacrosDialog({
    super.key,
    required this.macros,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: Container(
        decoration: borderDialog(
          const Color(0xffED1164),
        ),
        padding: const EdgeInsets.all(Spacing.s24),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.only(bottom: Spacing.s16),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(
                      color: Colors.white70,
                      style: TypographyType.header,
                      text: 'Calorias',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(width: Spacing.s16),
                    CustomText(
                      color: Colors.white,
                      style: TypographyType.header,
                      text: '${macros?.calorie}',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(height: Spacing.s16),
                const CustomDivider(color: Colors.white54),
                const SizedBox(height: Spacing.s16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CustomText(
                      color: Colors.white70,
                      style: TypographyType.label,
                      text: 'Balanceado',
                      textAlign: TextAlign.center,
                    ),
                    Column(
                      children: [
                        CustomText(
                          color: Colors.white,
                          style: TypographyType.body,
                          text:
                              'proteína: ${macros?.balanced?.protein?.toStringAsFixed(1)}',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: Spacing.s8),
                        CustomText(
                          color: Colors.white,
                          style: TypographyType.body,
                          text:
                              'gordura: ${macros?.balanced?.fat?.toStringAsFixed(1)}',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: Spacing.s8),
                        CustomText(
                          color: Colors.white,
                          style: TypographyType.body,
                          text:
                              'carboidratos ${macros?.balanced?.carbs?.toStringAsFixed(1)}',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: Spacing.s16),
                const CustomDivider(color: Colors.white54),
                const SizedBox(height: Spacing.s16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CustomText(
                      color: Colors.white70,
                      style: TypographyType.label,
                      text: 'Baixa em Gordura',
                      textAlign: TextAlign.center,
                    ),
                    Column(
                      children: [
                        CustomText(
                          color: Colors.white,
                          style: TypographyType.body,
                          text:
                              'proteína: ${macros?.lowfat?.protein?.toStringAsFixed(1)}',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: Spacing.s8),
                        CustomText(
                          color: Colors.white,
                          style: TypographyType.body,
                          text:
                              'gordura: ${macros?.lowfat?.fat?.toStringAsFixed(1)}',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: Spacing.s8),
                        CustomText(
                          color: Colors.white,
                          style: TypographyType.body,
                          text:
                              'carboidratos ${macros?.lowfat?.carbs?.toStringAsFixed(1)}',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: Spacing.s16),
                const CustomDivider(color: Colors.white54),
                const SizedBox(height: Spacing.s16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CustomText(
                      color: Colors.white70,
                      style: TypographyType.label,
                      text: 'Baixa em Carboidratos',
                      textAlign: TextAlign.center,
                    ),
                    Column(
                      children: [
                        CustomText(
                          color: Colors.white,
                          style: TypographyType.body,
                          text:
                              'proteína: ${macros?.lowcarbs?.protein?.toStringAsFixed(1)}',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: Spacing.s8),
                        CustomText(
                          color: Colors.white,
                          style: TypographyType.body,
                          text:
                              'gordura: ${macros?.lowcarbs?.fat?.toStringAsFixed(1)}',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: Spacing.s8),
                        CustomText(
                          color: Colors.white,
                          style: TypographyType.body,
                          text:
                              'carboidratos ${macros?.lowcarbs?.carbs?.toStringAsFixed(1)}',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: Spacing.s16),
                const CustomDivider(color: Colors.white54),
                const SizedBox(height: Spacing.s16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CustomText(
                      color: Colors.white70,
                      style: TypographyType.label,
                      text: 'Alta em Proteínas',
                      textAlign: TextAlign.center,
                    ),
                    Column(
                      children: [
                        CustomText(
                          color: Colors.white,
                          style: TypographyType.body,
                          text:
                              'proteína: ${macros?.highprotein?.protein?.toStringAsFixed(1)}',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: Spacing.s8),
                        CustomText(
                          color: Colors.white,
                          style: TypographyType.body,
                          text:
                              'gordura: ${macros?.highprotein?.fat?.toStringAsFixed(1)}',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: Spacing.s8),
                        CustomText(
                          color: Colors.white,
                          style: TypographyType.body,
                          text:
                              'carboidratos ${macros?.highprotein?.carbs?.toStringAsFixed(1)}',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Future<void> showMacrosDialog(
  BuildContext context, {
  required MacrosModel? data,
}) async {
  await showModalBottomSheet(
    context: context,
    backgroundColor: const Color(0xffED1164),
    shape: const RoundedRectangleBorder(borderRadius: borderRadius),
    constraints: BoxConstraints.loose(Size.infinite),
    isScrollControlled: true,
    builder: (context) {
      return MacrosDialog(
        macros: data,
      );
    },
  );
}
