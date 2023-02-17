// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:eventos_uesb/controller/ControllerCampoFiltro.dart';
import 'package:eventos_uesb/domain/Events.dart';

class CampoForm extends State<ControllerCampoFiltro> {
  var textFieldController = TextEditingController();
  bool loginError = false;
  ControllerCampoFiltro textFieldControllerTelaLogin =
      const ControllerCampoFiltro();

  @override
  void initState() {
    super.initState();
    loginError = false;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textFieldController,
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          Events.getFilterValue(value);
        });
      },
      decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.white,
          label: Text('Valor a filtrar')),
    );
  }
}
