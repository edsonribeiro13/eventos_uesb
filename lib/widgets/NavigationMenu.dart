import 'dart:ui';

import 'package:flutter/material.dart';

// ignore: camel_case_types
class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Container(
      height: 50,
      width: mediaQuery.size.width,
      decoration: const BoxDecoration(color: Color.fromARGB(224, 186, 63, 197)),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            IconButton(
                onPressed: null,
                iconSize: 30,
                icon: Icon(Icons.home_filled),
                color: Color.fromARGB(123, 185, 92, 177)),
            IconButton(
                onPressed: null,
                iconSize: 30,
                icon: Icon(Icons.person),
                color: Color.fromARGB(123, 185, 92, 177)),
            IconButton(
                onPressed: null,
                iconSize: 30,
                icon: Icon(Icons.exit_to_app),
                color: Color.fromARGB(123, 185, 92, 177))
          ]),
    );
  }
}
