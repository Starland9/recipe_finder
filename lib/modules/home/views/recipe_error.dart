import 'package:flutter/material.dart';

class RecipeErrorView extends StatelessWidget {
  const RecipeErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Un Probleme est survenu",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Verifiez votre connexion ou patientez un moment et reesayer .. Le cuisinier est peutetre occupe !",
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
