// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:eventos_uesb/assets/css/BasicCSS.dart';
import 'package:eventos_uesb/widgets/DefaultTextButton.dart';
import 'package:eventos_uesb/controller/ControllerTelaLogin.dart';

class TelaLogin extends State<ControllerTelaLogin> {
  var textFieldController = List<TextEditingController>.generate(
      2, (index) => TextEditingController());
  bool loginError = false;
  ControllerTelaLogin textFieldControllerTelaLogin =
      const ControllerTelaLogin();

  @override
  void initState() {
    super.initState();
    loginError = false;
  }

  @override
  Widget build(BuildContext context) {
    BasicCss basicCss = BasicCss();
    DefaultTextButton defaultTextButton = const DefaultTextButton(
      textButton: 'Esqueci Minha Senha',
      routeName: '',
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                        WidgetSpan(child: Text('CPF')),
                        WidgetSpan(
                            child: Text(
                          '*',
                          style: TextStyle(color: Colors.redAccent),
                        ))
                      ]))),
                ),
                TextField(
                  controller: textFieldController[1],
                  obscureText: true,
                  decoration: InputDecoration(
                      errorText: loginError == true
                          ? "Login ou senha Incorretos"
                          : null,
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
                    onPressed: () async {
                      var response = await textFieldControllerTelaLogin
                          .loginController(textFieldController);
                      response == true
                          // ignore: use_build_context_synchronously
                          ? Navigator.pushNamed(context, '/usuario')
                          : setState(() {
                              loginError = true;
                            });
                    },
                    style: TextButton.styleFrom(
                        foregroundColor: basicCss.basicColor,
                        backgroundColor: basicCss.basicColorSmother,
                        textStyle:
                            const TextStyle(fontSize: 20, fontFamily: 'arial')),
                    child: const Text('Entrar')),
                TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/cadastro'),
                    style: TextButton.styleFrom(
                        backgroundColor: basicCss.basicColorSmother,
                        foregroundColor: basicCss.basicColor,
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
