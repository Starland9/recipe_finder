import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_finder/blocs/recipe/bloc/recipe_bloc.dart';
import 'package:recipe_finder/modules/home/views/recipe_error.dart';
import 'package:recipe_finder/modules/home/views/recipe_initial.dart';
import 'package:recipe_finder/modules/home/views/recipe_loading.dart';
import 'package:recipe_finder/modules/recipe/recipe.dart';

import 'components/buttons.dart';
import 'components/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> ingredients = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipe Generator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocProvider(
          create: (context) => RecipeBloc(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchInput(onSearch: _addIngredients),
              _buildChipWrap(),
              Expanded(child: BlocBuilder<RecipeBloc, RecipeState>(
                builder: (context, state) {
                  return Center(
                    child: switch (state.runtimeType) {
                      RecipeInitial => const RecipeInitialView(),
                      RecipeLoading => const RecipeLoadingView(),
                      RecipeError => const RecipeErrorView(),
                      RecipeLoaded =>
                        RecipeCard(recipe: (state as RecipeLoaded).recipe),
                      Type() => const SizedBox(),
                    },
                  );
                },
              )),
              BlocBuilder<RecipeBloc, RecipeState>(
                builder: (context, state) {
                  return FindButton(
                    onPressed: () => context
                        .read<RecipeBloc>()
                        .add(RecipeGetEvent(ingredients: ingredients)),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Wrap _buildChipWrap() {
    return Wrap(
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
              label: Text(e),
            ),
          )
          .toList(),
    );
  }

  _addIngredients(String text) {
    setState(() {
      ingredients.add(text);
    });
  }
}
