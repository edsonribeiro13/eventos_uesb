// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:eventos_uesb/assets/css/BasicCSS.dart';
import 'package:eventos_uesb/controller/ControllerTelaCadastro.dart';

class TelaCadastro extends State<ControllerTelaCadastro> {
  var textFieldController = List<TextEditingController>.generate(
      3, (index) => TextEditingController());
  bool cadastroErro = false;
  String cadastroErroMensagem = '';
  ControllerTelaCadastro controllerTelaCadastro =
      const ControllerTelaCadastro();

  @override
  void initState() {
    cadastroErro = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BasicCss basicCss = BasicCss();

    return Scaffold(
      body: Center(
        child: Container(
            decoration: basicCss.iniatilzeDefaultBackground(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'lib/assets/images/uesb-logo.png',
                  scale: 3,
                ),
                TextField(
                  controller: textFieldController[0],
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      label: Text.rich(TextSpan(children: [
                        WidgetSpan(child: Text('Nome')),
                        WidgetSpan(
                            child: Text(
                          '*',
                          style: TextStyle(color: Colors.redAccent),
                        ))
                      ]))),
                ),
                TextField(
                  controller: textFieldController[1],
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      label: Text.rich(TextSpan(children: [
                        WidgetSpan(child: Text('CPF')),
                        WidgetSpan(
                            child: Text(
                          '*',
                          style: TextStyle(color: Colors.redAccent),
                        ))
                      ]))),
                ),
                TextField(
                  controller: textFieldController[2],
                  decoration: InputDecoration(
                      errorText:
                          cadastroErro == true ? cadastroErroMensagem : null,
                      filled: true,
                      fillColor: Colors.white,
                      label: const Text.rich(TextSpan(children: [
                        WidgetSpan(child: Text('Senha')),
                        WidgetSpan(
                            child: Text(
                          '*',
                          style: TextStyle(color: Colors.redAccent),
                        ))
                      ]))),
                ),
                TextButton(
                    onPressed: (() async {
                      var result = await controllerTelaCadastro
                          .cadastroController(textFieldController);
                      if (result[0] == false) {
                        cadastroErroMensagem = result[1];
                        setState(() {
                          cadastroErro = true;
                        });
                      } else {
                        // ignore: use_build_context_synchronously
                        Navigator.pushNamed(context, '/usuario');
                      }
                    }),
                    style: TextButton.styleFrom(
                        backgroundColor: basicCss.basicColor,
                        textStyle:
                            const TextStyle(fontSize: 20, fontFamily: 'arial')),
                    child: const Text('Realizar cadastro'))
              ],
            )),
      ),
    );
  }
}
