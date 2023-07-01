import 'package:flutter/material.dart';
import 'package:recipe_finder/models/recipe/recipe.dart';
import 'package:recipe_finder/modules/recipe/recipe.dart';

import 'components/buttons.dart';
import 'components/search.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> ingredients = [];
  Recipe? recipe;
  String? helperText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipe Generator"),
      ),
      backgroundColor: Colors.orange.shade50,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchInput(
              onSearch: (text) {
                setState(() {
                  ingredients.add(text);
                });
              },
            ),
            Wrap(
              spacing: 10,
              runSpacing: 0,
              children: ingredients
                  .map(
                    (e) => Chip(
                      onDeleted: () {
                        setState(() {
                          ingredients.remove(e);
                        });
                      },
                      label: Text(
                        e,
                      ),
                    ),
                  )
                  .toList(),
            ),
            Expanded(
              child: recipe == null
                  ? Center(child: Text(helperText ?? ""))
                  : SingleChildScrollView(
                      child: RecipeCard(
                        title: recipe!.title,
                        ingredients: recipe!.ingredients,
                        instructions: recipe!.directions,
                      ),
                    ),
            ),
            FindButton(
                ingredients: ingredients,
                onTap: (value) {
                  _searchRecipe(value);
                }),
          ],
        ),
      ),
    );
  }

  void _searchRecipe(value) {
    helperText == "Nous concevons une belle recette...";
    recipe = null;
    if (value is Recipe) {
      setState(() {
        recipe = value;
      });
    }
    if (value is String) {
      setState(() {
        helperText = value;
      });
    }
    if (value == null) {
      setState(() {
        helperText =
            "Le cuisinier est occupé, veuillez patientez et réessayer dans une minute !";
      });
    }
  }
}
