import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:translator/translator.dart';

import '../../models/recipe/recipe.dart';
import '../keys/ninja.dart';

class HuggingFace {
  static final HuggingFace _instance = HuggingFace._internal();

  factory HuggingFace() {
    return _instance;
  }

  HuggingFace._internal();

  static const modelsUrl = "https://api-inference.huggingface.co/models/";

  Uri _getModel(String modelName) {
    return Uri.parse(modelsUrl + modelName);
  }

  Future<Recipe> getRecipe(List<String> ingredients) async {
    String translatedIngredients =
        (await ingredients.join(",").translate()).text;

    var r = await http.post(
      _getModel("flax-community/t5-recipe-generation"),
      headers: _getHds,
      body: translatedIngredients,
    );

    return Recipe.from(jsonDecode(r.body)[0]["generated_text"]);
  }

  Map<String, String> get _getHds {
    return {
      'Authorization': "Bearer ${ApiKeys.huggingFace}",
      "Accept": "*/*",
      "Content-Type": "application/json",
    };
  }
}
