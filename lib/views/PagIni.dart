import 'package:flutter/material.dart';
import 'package:eventos_uesb/widgets/NavigationMenu.dart';
import 'package:eventos_uesb/widgets/CardGrid.dart';
import 'package:eventos_uesb/assets/css/BasicCSS.dart';

// ignore: camel_case_types, must_be_immutable
class pagIni extends StatelessWidget {
  pagIni({super.key});

  NavigationMenu navigationMenu = const NavigationMenu();
  CardGrid cardGrid = const CardGrid();

  @override
  Widget build(BuildContext context) {
    BasicCss basicCss = BasicCss();
    return MaterialApp(
        title: "Página Inicial",
        home: Scaffold(
          bottomNavigationBar: Row(children: [navigationMenu]),
          body: Center(
              child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: const [
                0.4,
                0.7,
              ],
              colors: [
                basicCss.basicColor,
                basicCss.basicColorSmother,
              ],
            )),
            child: cardGrid,
          )),
        ));
  }
}
