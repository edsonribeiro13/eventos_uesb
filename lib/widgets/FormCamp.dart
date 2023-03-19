// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:eventos_uesb/controller/ControllerCampoFiltro.dart';
import 'package:eventos_uesb/domain/Events.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:eventos_uesb/assets/css/BasicCSS.dart';

class CampoForm extends State<ControllerCampoFiltro> {
  static var textFieldController = TextEditingController();
  static String filterClause = 'data';
  ControllerCampoFiltro textFieldControllerTelaLogin =
      const ControllerCampoFiltro();
  static var maskFormatter = MaskTextInputFormatter(
    mask: '##/##/####',
  );

  @override
  void initState() {
    CampoForm.filterClause = 'data';
    super.initState();
  }

  static updateFilterClause() {
    CampoForm.filterClause = Events.getFilterClause();
    textFieldController.value = CampoForm.filterClause == 'data'
        ? maskFormatter.updateMask(mask: '##/##/####')
        : maskFormatter.updateMask(mask: '');
    textFieldController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    BasicCss basicCss = BasicCss();
    return Column(children: [
      Container(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: TextField(
            inputFormatters: [maskFormatter],
            controller: textFieldController,
            decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                label: Text('Valor a filtrar')),
          )),
      Container(
          padding: const EdgeInsets.only(top: 20),
          child: TextButton(
              onPressed: () async => {
                    await Events.setFilterValue(textFieldController.text),
                    await Events.filterEvent(),
                    Navigator.pushNamed(context, '/events')
                  },
              style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: basicCss.basicColorSmother,
                  textStyle: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold)),
              child: const Text('Filtrar')))
    ]);
  }
}
