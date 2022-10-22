import 'package:flutter/material.dart';
import 'package:eventos_uesb/widgets/NavigationMenu.dart';
import 'package:eventos_uesb/widgets/CardGrid.dart';

// ignore: camel_case_types, must_be_immutable
class pagIni extends StatelessWidget {
  pagIni({super.key});

  NavigationMenu navigationMenu = const NavigationMenu();
  CardGrid cardGrid = const CardGrid();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Página Inicial",
        home: Scaffold(
          bottomNavigationBar: Row(children: [navigationMenu]),
          body: cardGrid,
        ));
  }
}
