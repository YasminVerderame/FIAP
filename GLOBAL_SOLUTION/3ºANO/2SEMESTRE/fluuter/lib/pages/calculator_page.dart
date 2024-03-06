import 'package:flutter/material.dart';
import 'package:macros_amounts/components/button.dart';
import 'package:macros_amounts/components/inputs/dropdown.dart';
import 'package:macros_amounts/components/inputs/text.dart';
import 'package:macros_amounts/constants/spacings.dart';

class CalculatorPage extends StatelessWidget {
  final Function(String) onGenderSelected;
  final TextEditingController ageController;
  final TextEditingController heightController;
  final TextEditingController weightController;
  final Function(String) onActivityLevelSelected;
  final Function(String) onGoalSelected;
  final VoidCallback onCalculatePressed;

  const CalculatorPage({
    super.key,
    required this.onGenderSelected,
    required this.ageController,
    required this.heightController,
    required this.weightController,
    required this.onActivityLevelSelected,
    required this.onGoalSelected,
    required this.onCalculatePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDropdownInput(
          labelText: 'Gênero',
          items: const {
            'male': 'Masculino',
            'female': 'Feminino',
          },
          onValueSelected: (value) => onGenderSelected(value),
        ),
        const SizedBox(height: Spacing.s28),
        CustomTextInput(
          labelText: 'Idade',
          editingController: ageController,
          textInputType: TextInputType.number,
          maxLength: 3,
        ),
        const SizedBox(height: Spacing.s16),
        CustomTextInput(
          labelText: 'Altura (cm)',
          editingController: heightController,
          textInputType: TextInputType.number,
          maxLength: 3,
        ),
        const SizedBox(height: Spacing.s16),
        CustomTextInput(
          labelText: 'Peso (kg)',
          editingController: weightController,
          textInputType: TextInputType.number,
          maxLength: 3,
        ),
        const SizedBox(height: Spacing.s16),
        CustomDropdownInput(
          labelText: 'Nível de Atividade',
          items: const {
            "1": "Taxa de Metabolismo Basal (TMB)",
            "2": "Sedentário: pouco ou nenhum exercício",
            "3": "Exercício 1-3 vezes/semana",
            "4": "Exercício 4-5 vezes/semana",
            "5": "Exercício 3-4 vezes/semana",
            "6": "Exercício 6-7 vezes/semana",
            "7": "Exercício muito intenso diariamente, ou trabalho físico",
          },
          onValueSelected: (value) => onActivityLevelSelected(value),
        ),
        const SizedBox(height: Spacing.s28),
        CustomDropdownInput(
          labelText: 'Meta',
          items: const {
            "maintain": "Manter o Peso",
            "weightlose": "Perda de Peso",
            "mildlose": "Perda de Peso Leve",
            "extremelose": "Perda de Peso Extrema",
            "weightgain": "Ganho de Peso",
            "mildgain": "Ganho de Peso Leve",
            "extremegain": "Ganho de Peso Extremo",
          },
          onValueSelected: (value) => onGoalSelected(value),
        ),
        const Spacer(),
        CustomButton(
          label: 'Calcular',
          onPressed: onCalculatePressed,
        ),
      ],
    );
  }
}
