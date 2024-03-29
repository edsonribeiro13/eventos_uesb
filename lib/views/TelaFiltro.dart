// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:eventos_uesb/assets/css/BasicCSS.dart';
import 'package:eventos_uesb/controller/ControllerDropDown.dart';
import 'package:eventos_uesb/controller/ControllerCampoFiltro.dart';

// ignore: camel_case_types, must_be_immutable
class TelaFiltro extends StatelessWidget {
  const TelaFiltro({super.key});

  @override
  Widget build(BuildContext context) {
    BasicCss basicCss = BasicCss();
    DropdownButtonState dropdownMenu = const DropdownButtonState();
    ControllerCampoFiltro controllerCampoFiltro = const ControllerCampoFiltro();
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
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
          const Text('Filtrar por',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
          dropdownMenu,
          controllerCampoFiltro,
        ],
      ),
    ));
  }
}
