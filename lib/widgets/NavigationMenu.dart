// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:eventos_uesb/assets/css/BasicCSS.dart';

// ignore: camel_case_types
class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    BasicCss basicCss = BasicCss();

    return Container(
      height: 50,
      width: mediaQuery.size.width,
      decoration: BoxDecoration(color: basicCss.basicColor),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        IconButton(
            onPressed: null,
            iconSize: 30,
            icon: const Icon(Icons.home_filled),
            color: basicCss.basicColorSmother),
        IconButton(
            onPressed: null,
            iconSize: 30,
            icon: const Icon(Icons.person),
            color: basicCss.basicColorSmother),
        IconButton(
            onPressed: null,
            iconSize: 30,
            icon: const Icon(Icons.exit_to_app),
            color: basicCss.basicColorSmother)
      ]),
    );
  }
}
