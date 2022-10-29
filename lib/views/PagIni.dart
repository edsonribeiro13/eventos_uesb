// ignore_for_file: file_names

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
    return Scaffold(
        bottomNavigationBar: Row(children: [navigationMenu]),
        floatingActionButton: const IconButton(
            icon: Icon(Icons.notifications), onPressed: null, iconSize: 35),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        body: Center(
            child: Container(
          padding: EdgeInsets.zero,
          decoration: basicCss.iniatilzeDefaultBackground(),
          child: cardGrid,
        )));
  }
}
