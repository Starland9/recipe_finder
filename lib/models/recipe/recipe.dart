class Recipe {
  String title;
  String ingredients;
  String directions;

  Recipe({
    required this.title,
    required this.ingredients,
    required this.directions,
  });

  factory Recipe.from(String text) {
    List<String> results = ["", "", ""];

    List<String> words = text.split(" ");
    int index = 0;
    for (var word in words) {
      if (word == "title:") {
        index = 0;
      } else if (word == "ingredients:") {
        index = 1;
      } else if (word == "directions:") {
        index = 2;
      }
      if (["title:", "ingredients:", "directions:"].contains(word)) {
        continue;
      }
      results[index] += "$word ";
    }

    return Recipe(
      title: results[0],
      ingredients: results[1],
      directions: results[2],
    );
  }
}
