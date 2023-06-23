import 'package:flutter/material.dart';
import 'package:recipe_finder/models/recipe/recipe.dart';
import 'package:recipe_finder/modules/recipe/recipe.dart';
import 'package:recipe_finder/widgets/texts.dart';

import '../../utils/logic.dart';
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
  List<Recipe>? recipes;
  String? helperText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Trouve ta recette avec ce que tu as dans ton frigo !",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
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
              child: recipes != null || (recipes ?? []).isNotEmpty
                  ? RecipeList(recipes: recipes ?? [])
                  : Center(
                      child: Text(
                        helperText ?? "",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
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
    helperText == null;
    recipes = null;
    if (value is List<Recipe>) {
      setState(() {
        recipes = value;
      });
    }
    if (value is String) {
      setState(() {
        helperText = value;
      });
    }
    if (value == null) {
      setState(() {
        helperText = "Voire les recettes trouvées !";
      });
    }
  }
}

class RecipeList extends StatelessWidget {
  const RecipeList({super.key, required this.recipes});

  final List<Recipe> recipes;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.food_bank_outlined),
            onTap: () {
              Nav.push(context, RecipePage(recipe: recipes[index]));
            },
            title: TextTr(
              recipes[index].title!,
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: recipes.length);
  }
}
