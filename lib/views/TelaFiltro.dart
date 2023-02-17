// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:eventos_uesb/assets/css/BasicCSS.dart';
import 'package:eventos_uesb/controller/ControllerDropDown.dart';
import 'package:eventos_uesb/controller/ControllerCampoFiltro.dart';
import 'package:eventos_uesb/domain/Events.dart';

// ignore: camel_case_types, must_be_immutable
class TelaFiltro extends StatelessWidget {
  const TelaFiltro({super.key});

  @override
  Widget build(BuildContext context) {
    BasicCss basicCss = BasicCss();
    DropdownButtonState dropdownMenu = const DropdownButtonState();
    ControllerCampoFiltro controllerCampoFiltro = const ControllerCampoFiltro();
    return Scaffold(
        body: Container(
      decoration: basicCss.iniatilzeDefaultBackground(),
      child: Column(
        children: [
          Image.asset(
            'lib/assets/images/uesb-logo.png',
            scale: 3,
          ),
          const Text('Escolha um elemento para filtrar',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
          dropdownMenu,
          controllerCampoFiltro,
          TextButton(
              onPressed: () async => {
                    await Events.filterEvent(),
                    Navigator.pushNamed(context, '/events')
                  },
              style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: basicCss.basicColorSmother,
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              child: const Text('Filtrar'))
        ],
      ),
    ));
  }
}
