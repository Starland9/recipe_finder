class Recipe {
  String? title;
  String? ingredients;
  String? servings;
  String? instructions;

  Recipe({
    this.title,
    this.ingredients,
    this.servings,
    this.instructions,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'ingredients': ingredients,
        'servings': servings,
        'instructions': instructions,
      };

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      title: json['title'],
      ingredients: json['ingredients'],
      servings: json['servings'],
      instructions: json['instructions'],
    );
  }

  bool containsIngredient(String word) {
    return ingredients!.contains(word) ||
        instructions!.contains(word) ||
        servings!.contains(word) ||
        title!.contains(word);
  }
}
