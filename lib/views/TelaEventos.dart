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
    var listOfElements = ListOfElements(data: Events.events);
    BasicCss basicCss = BasicCss();
    MediaQueryData mediaQuery = MediaQuery.of(context);
    bool isAdmin = Events.userIsAdmin;
    return Scaffold(
        bottomNavigationBar: const NavigationMenu(),
        floatingActionButton: IconButton(
          onPressed: () => isAdmin
              ? {
                  Events.setTelaCriarEvento(),
                  Navigator.pushNamed(context, '/RegisterEvent')
                }
              : Navigator.pushNamed(context, '/filtrar'),
          icon: isAdmin ? const Icon(Icons.add) : const Icon(Icons.filter_alt),
          iconSize: isAdmin ? 60 : 40,
        ),
        floatingActionButtonLocation: isAdmin
            ? FloatingActionButtonLocation.endFloat
            : FloatingActionButtonLocation.endTop,
        body: Container(
          padding: EdgeInsets.symmetric(
              vertical: mediaQuery.size.height / 12, horizontal: 0),
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
