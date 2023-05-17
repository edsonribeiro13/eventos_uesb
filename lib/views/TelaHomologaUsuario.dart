// ignore_for_file: file_names
import 'package:eventos_uesb/domain/Events.dart';
import 'package:eventos_uesb/assets/css/BasicCSS.dart';
import 'package:flutter/material.dart';
import 'package:eventos_uesb/widgets/NavigationMenu.dart';
import 'package:eventos_uesb/controller/ControllerHomologacao.dart';

class TelaHomologaUsuario extends State<ControllerHomologacao> {
  bool subscribed = false;
  var textFieldController = TextEditingController();
  bool insertError = false;
  var usersToHomologate = Events.getUsersToHomologate();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BasicCss basicCss = BasicCss();
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(
              vertical: mediaQuery.size.height / 8, horizontal: 0),
          decoration: basicCss.iniatilzeDefaultBackground(),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            usersToHomologate.length > 0
                ? SizedBox(
                    height: (50.0 * usersToHomologate.length),
                    child: ListView.builder(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        itemCount: usersToHomologate.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return Container(
                              color: basicCss.basicColorSmother,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(usersToHomologate[index],
                                        style: const TextStyle(
                                            fontFamily: 'arial')),
                                    IconButton(
                                        iconSize: 20,
                                        onPressed: () async => {
                                              Events.deleteUserFromHomolog(
                                                  usersToHomologate[index]),
                                              await Events.removeUser(
                                                  usersToHomologate[index]),
                                              setState(() => {
                                                    usersToHomologate = Events
                                                        .getUsersToHomologate()
                                                  })
                                            },
                                        icon: const Icon(Icons.add)),
                                    IconButton(
                                        iconSize: 20,
                                        onPressed: () async => {
                                              Events.deleteUserFromHomolog(
                                                  usersToHomologate[index]),
                                              Events.removeEventFromUser(
                                                  usersToHomologate[index]),
                                              await Events.removeUser(
                                                  usersToHomologate[index]),
                                              setState(() => {
                                                    usersToHomologate = Events
                                                        .getUsersToHomologate()
                                                  })
                                            },
                                        icon: const Icon(Icons.delete))
                                  ]));
                        }))
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                        Text(
                          "Usuário por homologar aparecerão aqui",
                          style: TextStyle(fontSize: 20),
                        )
                      ])
          ]),
        ),
        bottomNavigationBar: const NavigationMenu());
  }
}
