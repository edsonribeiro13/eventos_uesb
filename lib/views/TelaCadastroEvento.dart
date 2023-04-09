// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:eventos_uesb/assets/css/BasicCSS.dart';
import 'package:eventos_uesb/controller/ControllerTelaCadastroEvento.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TelaCadastroEvento extends State<ControllerTelaCadastroEvento> {
  var textFieldController = List<TextEditingController>.generate(
      7, (index) => TextEditingController());
  bool cadastroErro = false;
  String cadastroErroMensagem = '';
  ControllerTelaCadastroEvento controllerTelaCadastro =
      const ControllerTelaCadastroEvento();
  static var maskFormatterDate = MaskTextInputFormatter(
    mask: '##/##/####',
  );
  static var maskFormatterTime = MaskTextInputFormatter(
    mask: '##:##',
  );

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
            padding: const EdgeInsets.only(top: 30),
            decoration: basicCss.iniatilzeDefaultBackground(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  controller: textFieldController[0],
                  decoration: InputDecoration(
                      errorText:
                          cadastroErro == true ? cadastroErroMensagem : null,
                      filled: true,
                      fillColor: Colors.white,
                      label: const Text.rich(TextSpan(children: [
                        WidgetSpan(child: Text('Nome do evento')),
                        WidgetSpan(
                            child: Text(
                          '*',
                          style: TextStyle(color: Colors.redAccent),
                        ))
                      ]))),
                ),
                TextField(
                  inputFormatters: [maskFormatterDate],
                  controller: textFieldController[1],
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      label: Text.rich(TextSpan(children: [
                        WidgetSpan(child: Text('Data')),
                        WidgetSpan(
                            child: Text(
                          '*',
                          style: TextStyle(color: Colors.redAccent),
                        ))
                      ]))),
                ),
                TextField(
                  controller: textFieldController[2],
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      label: Text.rich(TextSpan(children: [
                        WidgetSpan(child: Text('Departamento')),
                        WidgetSpan(
                            child: Text(
                          '*',
                          style: TextStyle(color: Colors.redAccent),
                        ))
                      ]))),
                ),
                TextField(
                  inputFormatters: [maskFormatterTime],
                  controller: textFieldController[3],
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      label: Text.rich(TextSpan(children: [
                        WidgetSpan(child: Text('Horário')),
                        WidgetSpan(
                            child: Text(
                          '*',
                          style: TextStyle(color: Colors.redAccent),
                        ))
                      ]))),
                ),
                TextField(
                  controller: textFieldController[4],
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      label: Text.rich(TextSpan(children: [
                        WidgetSpan(child: Text('Limite de pessoas')),
                      ]))),
                ),
                TextField(
                  controller: textFieldController[5],
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      label: Text.rich(TextSpan(children: [
                        WidgetSpan(child: Text('Local')),
                        WidgetSpan(
                            child: Text(
                          '*',
                          style: TextStyle(color: Colors.redAccent),
                        ))
                      ]))),
                ),
                TextField(
                  controller: textFieldController[6],
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      label: Text.rich(TextSpan(children: [
                        WidgetSpan(child: Text('Nome do organizador')),
                        WidgetSpan(
                            child: Text(
                          '*',
                          style: TextStyle(color: Colors.redAccent),
                        ))
                      ]))),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: TextButton(
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
                              Navigator.pushNamed(context, '/');
                            }
                          }),
                          style: TextButton.styleFrom(
                              backgroundColor: basicCss.basicColor,
                              textStyle: const TextStyle(
                                  fontSize: 20, fontFamily: 'arial'),
                              foregroundColor: Colors.black),
                          child: const Text('Cadastrar evento'))),
                  TextButton(
                      onPressed: (() =>
                          // ignore: use_build_context_synchronously
                          Navigator.pushNamed(context, '/')),
                      style: TextButton.styleFrom(
                          backgroundColor: basicCss.basicColor,
                          textStyle: const TextStyle(
                              fontSize: 20, fontFamily: 'arial'),
                          foregroundColor: Colors.black),
                      child: const Text('Cancelar cadastro'))
                ])
              ],
            )),
      ),
    );
  }
}