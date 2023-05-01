// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:eventos_uesb/views/TelaCadastroEvento.dart';
import 'package:eventos_uesb/domain/Events.dart';

class ControllerTelaCadastroEvento extends StatefulWidget {
  const ControllerTelaCadastroEvento({super.key});

  @override
  State<StatefulWidget> createState() => TelaCadastroEvento();

  cadastroController(textFieldController, method, oldEvent) async {
    if (textFieldController[0].text.isNotEmpty &&
        textFieldController[1].text.isNotEmpty &&
        textFieldController[2].text.isNotEmpty &&
        textFieldController[3].text.isNotEmpty &&
        textFieldController[5].text.isNotEmpty &&
        textFieldController[6].text.isNotEmpty) {
      if (textFieldController[5].text.isNotEmpty) {
        try {
          int.parse(textFieldController[4].text);
        } catch (e) {
          return [false, 'Número de participantes deve ser um número'];
        }
      }

      Events.insertNewEvent(textFieldController, method, oldEvent);

      return [true, ''];
    }
    return [false, 'Campos com * não podem ser vazios'];
  }
}
