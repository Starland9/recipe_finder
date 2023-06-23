import 'package:flutter/material.dart';
import 'package:recipe_finder/widgets/texts.dart';

class IngredientsWidget extends StatelessWidget {
  final String ingredients;

  const IngredientsWidget({super.key, required this.ingredients});

  @override
  Widget build(BuildContext context) {
    List<String> ingredientList = ingredients.split('|');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: ingredientList
          .map((ingredient) => TextTr(
                ingredient.trim(),
                style: const TextStyle(
                  fontSize: 15,
                ),
              ))
          .toList(),
    );
  }
}

class InstructionsWidget extends StatelessWidget {
  final String instructions;

  const InstructionsWidget({super.key, required this.instructions});

  @override
  Widget build(BuildContext context) {
    List<String> instructionList = instructions.split('.');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(instructionList.length, (index) {
        String instruction = instructionList[index].trim();
        if (int.tryParse(instruction) != null ||
            instructions.isEmpty ||
            instructions == " ") {
          return const SizedBox();
        }
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: TextTr(
            instruction,
            style: const TextStyle(fontSize: 16),
          ),
        );
      }),
    );
  }
}
