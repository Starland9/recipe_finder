import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recipe_finder/apis/services/hugging_face.dart';
import 'package:recipe_finder/models/recipe/recipe.dart';

part 'recipe_event.dart';
part 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  RecipeBloc() : super(RecipeInitial()) {
    on<RecipeGetEvent>(_getRecipe);
  }

  FutureOr<void> _getRecipe(
      RecipeGetEvent event, Emitter<RecipeState> emit) async {
    emit(RecipeLoading());
    try {
      final result = await HuggingFace().getRecipe(event.ingredients);
      emit(RecipeLoaded(recipe: result));
    } catch (e) {
      emit(RecipeError());
    }
  }
}
