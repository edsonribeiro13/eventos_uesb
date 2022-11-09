// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:eventos_uesb/assets/css/BasicCSS.dart';

class TelaRecuperarSenha extends StatelessWidget {
  const TelaRecuperarSenha({super.key});

  @override
  Widget build(BuildContext context) {
    BasicCss basicCss = BasicCss();
    return Scaffold(
        body: Container(
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
                        WidgetSpan(child: Text('Código de recuperação')),
                        WidgetSpan(
                            child: Text(
                          '*',
                          style: TextStyle(color: Colors.redAccent),
                        ))
                      ]))),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/retrievevalidate');
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: basicCss.basicColorSmother,
                        foregroundColor: basicCss.basicColor,
                        textStyle:
                            const TextStyle(fontSize: 20, fontFamily: 'arial')),
                    child: const Text('Validar código'))
              ],
            )));
  }
}
