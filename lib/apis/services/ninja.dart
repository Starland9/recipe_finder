import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipe_finder/models/recipe/recipe.dart';
import 'package:translator/translator.dart';

import '../../utils/logic.dart';
import '../keys/ninja.dart';

class Ninja {
  static Future<List<Recipe>>? getRecipes(String word) async {
    try {
      String translatedWord = (await word.translate()).text;

      var r =
          await http.get(getEndPoint("recipe?query=$translatedWord"), headers: {
        'X-Api-Key': ApiKeys.ninja,
      });

      List<Recipe> recipes =
          List.from(jsonDecode(r.body)).map((e) => Recipe.fromJson(e)).toList();
      return recipes;
    } catch (e) {
      return [];
    }
  }

  static Future<dynamic>? getFullRecipes(List<String> words) async {
    try {
      List<Recipe> recipes = [];

      for (var word in words) {
        recipes.addAll((await getRecipes(word))!.toList());
      }
      recipes.shuffle();
      if (recipes.isEmpty) {
        return "Aucun résultat trouvé !";
      }
      return recipes;
    } catch (e) {
      return "Une erreur est survenue !";
    }
  }

  static Recipe getRandomRecipe(List<Recipe> recipes, List<String> words) {
    List<Recipe> rps = [];

    for (var recipe in recipes) {
      for (var word in words) {
        if (recipe.containsIngredient(word.toLowerCase())) {
          rps.add(recipe);
        }
      }
    }

    rps.shuffle();
    return rps.first;
  }
}
