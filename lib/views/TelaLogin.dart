// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:eventos_uesb/assets/css/BasicCSS.dart';
import 'package:eventos_uesb/widgets/DefaultTextButton.dart';

class TelaLogin extends StatelessWidget {
  const TelaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    BasicCss basicCss = BasicCss();
    DefaultTextButton defaultTextButton =
        const DefaultTextButton(textButton: 'Esqueci Minha Senha');

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
                const TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      label: Text.rich(TextSpan(children: [
                        WidgetSpan(child: Text('Login')),
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
                        textStyle:
                            const TextStyle(fontSize: 20, fontFamily: 'arial')),
                    child: const Text('Entrar')),
                TextButton(
                    onPressed: null,
                    style: TextButton.styleFrom(
                        backgroundColor: basicCss.basicColorSmother,
                        textStyle:
                            const TextStyle(fontSize: 20, fontFamily: 'arial')),
                    child: const Text('Cadastrar-se')),
                defaultTextButton
              ],
            )),
      ),
    );
  }
}
