// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:eventos_uesb/views/TelaLogin.dart';
import 'package:eventos_uesb/utils/store/UserStore.dart';
import 'package:eventos_uesb/utils/repository/Querys.dart';

class ControllerTelaLogin extends StatefulWidget {
  const ControllerTelaLogin({super.key});

  @override
  State<StatefulWidget> createState() => TelaLogin();

  loginController(textFieldController) async {
    Querys querys = Querys();
    UserStore userStore = UserStore();

    var result = await querys.searchUser(
        textFieldController[0].text, textFieldController[1].text);

    if (result.rows.toString() != '()') {
      userStore.addUser(textFieldController[0].text);
      return true;
    } else {
      textFieldController[0].text = '';
      textFieldController[1].text = '';
      return false;
    }
  }
}
