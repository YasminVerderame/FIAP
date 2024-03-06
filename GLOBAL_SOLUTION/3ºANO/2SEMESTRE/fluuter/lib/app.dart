import 'package:flutter/material.dart';
import 'package:macros_amounts/pages/calculator_screen.dart';

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Macro Amounts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xffED1164),
        ),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}
