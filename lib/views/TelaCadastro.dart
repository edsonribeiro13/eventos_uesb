// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:eventos_uesb/assets/css/BasicCSS.dart';

class TelaCadastro extends StatelessWidget {
  const TelaCadastro({super.key});

  @override
  Widget build(BuildContext context) {
    BasicCss basicCss = BasicCss();

    return MaterialApp(
        title: "Tela Cadastro",
        home: Scaffold(
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
                    const TextField(
                      decoration: InputDecoration(
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
                    const TextField(
                      decoration: InputDecoration(
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
                    const TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          label: Text.rich(TextSpan(children: [
                            WidgetSpan(child: Text('Senha')),
                            WidgetSpan(
                                child: Text(
                              '*',
                              style: TextStyle(color: Colors.redAccent),
                            ))
                          ]))),
                    ),
                    TextButton(
                        onPressed: null,
                        style: TextButton.styleFrom(
                            backgroundColor: basicCss.basicColor,
                            textStyle: const TextStyle(
                                fontSize: 20, fontFamily: 'arial')),
                        child: const Text('Realizar cadastro'))
                  ],
                )),
          ),
        ));
  }
}
