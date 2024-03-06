import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macros_amounts/bloc/macros_bloc.dart';
import 'package:macros_amounts/components/app_bar.dart';
import 'package:macros_amounts/components/loader.dart';
import 'package:macros_amounts/constants/spacings.dart';
import 'package:macros_amounts/pages/calculator_page.dart';
import 'package:macros_amounts/pages/modal/macros_modal.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});
  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final ageController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  String gender = '';
  String activityLevel = '';
  String goal = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'Macro Calculator'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Spacing.s16),
          child: BlocProvider(
            create: (context) => MacrosBloc(),
            child: BlocConsumer<MacrosBloc, MacrosState>(
              builder: (context, state) {
                if (state is MacrosLoading) {
                  return const CustomLoader();
                }
                return CalculatorPage(
                  onGenderSelected: (value) => gender = value,
                  ageController: ageController,
                  heightController: heightController,
                  weightController: weightController,
                  onActivityLevelSelected: (value) => activityLevel = value,
                  onGoalSelected: (value) => goal = value,
                  onCalculatePressed: () async {
                    context.read<MacrosBloc>().add(GetMacrosEvent(
                          gender: gender,
                          age: int.parse(ageController.text.isEmpty
                              ? "-1"
                              : ageController.text),
                          height: int.parse(heightController.text.isEmpty
                              ? "-1"
                              : heightController.text),
                          weight: int.parse(weightController.text.isEmpty
                              ? "-1"
                              : weightController.text),
                          activityLevel: activityLevel,
                          goal: goal,
                        ));
                  },
                );
              },
              listener: (context, state) {
                if (state is MacrosSuccess) {
                  showMacrosDialog(
                    context,
                    data: state.data,
                  );
                }
                if (state is MacrosError) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.error!),
                    duration: const Duration(seconds: 5),
                  ));
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}