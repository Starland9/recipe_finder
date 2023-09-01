import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';

class RecipeLoadingView extends StatefulWidget {
  const RecipeLoadingView({super.key});

  @override
  State<RecipeLoadingView> createState() => _RecipeLoadingViewState();
}

class _RecipeLoadingViewState extends State<RecipeLoadingView>
    with TickerProviderStateMixin {
  late FlutterGifController _controller;

  @override
  void initState() {
    _controller = FlutterGifController(vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.repeat(
        min: 0,
        max: 9,
        period: const Duration(milliseconds: 1000),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GifImage(
          image: const AssetImage("assets/recipe-cuisine.gif"),
          controller: _controller,
          height: 100,
        ),
        const SizedBox(height: 10),
        const Text("Nous contruisons ta recette..."),
      ],
    );
  }
}
