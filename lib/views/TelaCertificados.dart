// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:eventos_uesb/widgets/DoubleCardGrid.dart';
import 'package:eventos_uesb/assets/css/BasicCSS.dart';

// ignore: camel_case_types, must_be_immutable
class TelaCertificados extends StatelessWidget {
  TelaCertificados({super.key});

  DoubleCardGrid cardGrid = const DoubleCardGrid(botaoNome: 'Certificado');

  @override
  Widget build(BuildContext context) {
    BasicCss basicCss = BasicCss();
    return Scaffold(
        body: Container(
      decoration: basicCss.iniatilzeDefaultBackground(),
      child: Column(
        children: [
          Image.asset(
            'lib/assets/images/uesb-logo.png',
            scale: 3,
          ),
          cardGrid
        ],
      ),
    ));
  }
}
