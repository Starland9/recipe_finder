part of 'recipe_bloc.dart';

@immutable
sealed class RecipeState {}

final class RecipeInitial extends RecipeState {}

final class RecipeLoading extends RecipeState {}

final class RecipeLoaded extends RecipeState {
  final Recipe recipe;

  RecipeLoaded({required this.recipe});
}

final class RecipeError extends RecipeState {}
