import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  SearchInput({
    super.key,
    required this.onSearch,
  });

  final Function(String text)? onSearch;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 10),
        border: OutlineInputBorder(
          gapPadding: 0,
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: "Ajoute ton ingredient ici",
        suffixIcon: IconButton.filled(
          style: const ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.horizontal(right: Radius.circular(12)))),
          ),
          onPressed: () {
            onSearch?.call(controller.text);
            controller.clear();
          },
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
