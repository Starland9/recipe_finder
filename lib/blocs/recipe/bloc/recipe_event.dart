part of 'recipe_bloc.dart';

@immutable
sealed class RecipeEvent {}

class RecipeGetEvent extends RecipeEvent {
  final List<String> ingredients;

  RecipeGetEvent({required this.ingredients});
}
