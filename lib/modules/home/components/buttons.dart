import 'package:flutter/material.dart';

import '../../../apis/services/ninja.dart';

class FindButton extends StatelessWidget {
  const FindButton({
    super.key,
    this.onTap,
    required this.ingredients,
  });

  final Function(dynamic value)? onTap;
  final List<String> ingredients;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      style: const ButtonStyle(
        fixedSize: MaterialStatePropertyAll(Size(double.maxFinite, 50)),
      ),
      onPressed: () {
        onTap!("Nous cherchons ta recette...");
        Ninja.getFullRecipes(ingredients)?.then((value) {
          onTap!(value);
        });
      },
      icon: const Icon(Icons.hdr_strong_sharp),
      label: const Text(
        "Trouver ma recette",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
