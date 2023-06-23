import 'package:flutter/material.dart';

import '../utils/logic.dart';

class TextTr extends Text {
  const TextTr(
    super.data, {
    super.key,
    super.style,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: tr(data ?? ""),
        builder: (context, snapshot) {
          return Text(
            snapshot.data ?? data ?? "",
            style: style,
          );
        });
  }
}
