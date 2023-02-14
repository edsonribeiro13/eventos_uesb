// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:eventos_uesb/views/TelaCadastro.dart';
import 'package:eventos_uesb/utils/store/UserStore.dart';
import 'package:eventos_uesb/utils/repository/Querys.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';

class ControllerTelaCadastro extends StatefulWidget {
  const ControllerTelaCadastro({super.key});

  @override
  State<StatefulWidget> createState() => TelaCadastro();

  cadastroController(textFieldController) async {
    if (CPFValidator.isValid(textFieldController[1].text) == false) {
      textFieldController[1].text = '';
      return [false, 'CPF Inválido'];
    }

    Querys querys = Querys();
    UserStore userStore = UserStore();

    try {
      await querys.createNewUser(textFieldController[0].text,
          textFieldController[1].text, textFieldController[2].text);
      userStore.addUser(textFieldController[1].text);
      return [true, ''];
    } catch (e) {
      print(e);
      textFieldController[0].text = '';
      textFieldController[1].text = '';
      textFieldController[2].text = '';
      return [false, 'Erro no cadastro'];
    }
  }
}
