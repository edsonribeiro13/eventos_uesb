// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:eventos_uesb/assets/css/BasicCSS.dart';
import 'package:eventos_uesb/widgets/NavigationMenu.dart';
import 'package:eventos_uesb/widgets/ListOfElements.dart';
import 'package:eventos_uesb/domain/Events.dart';

// ignore: camel_case_types, must_be_immutable
class TelaEventos extends StatelessWidget {
  const TelaEventos({super.key});

  @override
  Widget build(BuildContext context) {
    var listOfElements = ListOfElements(data: Events.eventSplited);
    BasicCss basicCss = BasicCss();
    return Scaffold(
        bottomNavigationBar: const NavigationMenu(),
        floatingActionButton: const IconButton(
          onPressed: null,
          icon: Icon(Icons.filter_alt),
          iconSize: 40,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        body: Container(
          decoration: basicCss.iniatilzeDefaultBackground(),
          child: Column(
            children: [
              Image.asset(
                'lib/assets/images/uesb-logo.png',
                scale: 3,
              ),
              listOfElements
            ],
          ),
        ));
  }
}
