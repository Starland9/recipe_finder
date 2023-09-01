import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_finder/blocs/recipe/bloc/recipe_bloc.dart';

class FindButton extends StatelessWidget {
  const FindButton({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeBloc, RecipeState>(
      builder: (context, state) {
        if (state is RecipeLoading) {
          return const Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(),
            ),
          );
        }
        return FilledButton.icon(
          style: ButtonStyle(
              fixedSize:
                  const MaterialStatePropertyAll(Size(double.maxFinite, 50)),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)))),
          onPressed: onPressed,
          icon: const Icon(Icons.hdr_strong_sharp),
          label: const Text(
            "Trouver ma recette",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}
