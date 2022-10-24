// ignore_for_file: file_names

import 'package:flutter/material.dart';

class BasicCss {
  Color basicColor = const Color.fromARGB(224, 186, 63, 197);
  Color basicColorSmother = const Color.fromARGB(123, 185, 92, 177);

  BoxDecoration iniatilzeDefaultBackground() {
    return BoxDecoration(
        gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      stops: const [
        0.4,
        0.7,
      ],
      colors: [
        basicColor,
        basicColorSmother,
      ],
    ));
  }
}
