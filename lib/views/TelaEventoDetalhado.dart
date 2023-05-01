// ignore_for_file: file_names

import 'package:eventos_uesb/domain/Events.dart';
import 'package:eventos_uesb/assets/css/BasicCSS.dart';
import 'package:flutter/material.dart';
import 'package:eventos_uesb/widgets/NavigationMenu.dart';
import 'package:eventos_uesb/utils/store/UserStore.dart';
import 'package:eventos_uesb/controller/ControllerTelaEventoDetalhado.dart';

class TelaEventoDetalhado extends State<TelaEventoDetalhadoState> {
  String buttonText = 'Inscreva-se no evento';
  bool subscribed = false;
  static bool userPage = false;

  static void setUserPage() {
    TelaEventoDetalhado.userPage = true;
  }

  static void unsetUserPage() {
    TelaEventoDetalhado.userPage = false;
  }

  @override
  void initState() {
    if (TelaEventoDetalhado.userPage) {
      buttonText = 'Inscrito!';
      subscribed = true;
    } else {
      buttonText = 'Inscreva-se no evento';
      subscribed = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BasicCss basicCss = BasicCss();
    var event = Events.getEventDetailed();
    MediaQueryData mediaQuery = MediaQuery.of(context);
    var userCpf = {};
    var userIsAdmin = Events.getUserIsAdmin();
    var userIsManager = Events.getUserIsMager();
    var userIsCollaborator = Events.getUserIsCollaborator();

    return Scaffold(
        floatingActionButton: ElevatedButton.icon(
            icon: userIsAdmin || userIsManager
                ? const Icon(Icons.group)
                : userIsCollaborator
                    ? const Icon(Icons.edit)
                    : const Icon(Icons.arrow_back),
            label: userIsAdmin || userIsManager
                ? const Text('Administrar equipe do evento')
                : userIsCollaborator
                    ? const Text('Editar evento')
                    : const Text('Voltar'),
            onPressed: () async => userIsAdmin || userIsManager
                ? {
                    await Events.retrieveManager(event['id']),
                    await Events.retrieveCollaborators(event['id']),
                    Navigator.pushNamed(context, '/controleOrganização')
                  }
                : userIsCollaborator
                    ? Navigator.pushNamed(context, '/RegisterEvent')
                    : Navigator.pop(context),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(basicCss.basicColorSmother))),
        floatingActionButtonLocation:
            userIsAdmin || userIsManager || userIsCollaborator
                ? FloatingActionButtonLocation.endFloat
                : FloatingActionButtonLocation.startTop,
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: mediaQuery.size.height / 8, horizontal: 0),
            decoration: basicCss.iniatilzeDefaultBackground(),
            child: Column(
              children: [
                Card(
                    child: ListTile(
                        leading: const Icon(Icons.title),
                        title: Text(
                          event['nome'],
                          style: const TextStyle(fontSize: 25),
                        ))),
                Card(
                    child: ListTile(
                        leading: const Icon(Icons.timelapse),
                        title: Text(
                          event['horario'],
                          style: const TextStyle(fontSize: 25),
                        ))),
                Card(
                    child: ListTile(
                        leading: const Icon(Icons.date_range),
                        title: Text(
                          event['data'],
                          style: const TextStyle(fontSize: 25),
                        ))),
                Card(
                    child: ListTile(
                        leading: const Icon(Icons.biotech),
                        title: Text(
                          event['departamento'],
                          style: const TextStyle(fontSize: 25),
                        ))),
                Card(
                    child: ListTile(
                        leading: const Icon(Icons.people),
                        title: Text(
                          event['limite'],
                          style: const TextStyle(fontSize: 25),
                        ))),
                Card(
                    child: ListTile(
                        leading: const Icon(Icons.emoji_people),
                        title: Text(
                          event['organizador'],
                          style: const TextStyle(fontSize: 25),
                        ))),
                Card(
                    child: ListTile(
                        leading: const Icon(Icons.place),
                        title: Text(
                          event['local'],
                          style: const TextStyle(fontSize: 25),
                        ))),
                Container(
                    padding: EdgeInsets.only(top: mediaQuery.size.height / 16),
                    child: userIsCollaborator || userIsManager || userIsAdmin
                        ? ElevatedButton.icon(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    basicCss.basicColor)),
                            onPressed: () async => {
                                  if (!subscribed)
                                    {
                                      if (await UserStore().getUser() != null)
                                        {
                                          userCpf = await UserStore().getUser(),
                                          Events.subscribeToEvent(
                                              event['id'], userCpf['idUser']),
                                          setState(() {
                                            buttonText = 'Inscrito!';
                                            subscribed = true;
                                          })
                                        }
                                      else
                                        {Navigator.pushNamed(context, '/login')}
                                    }
                                },
                            icon: const Icon(
                              Icons.check,
                              size: 25,
                            ),
                            label: Text(
                              buttonText,
                              style: const TextStyle(fontSize: 30),
                            ))
                        : Container(
                            padding: const EdgeInsets.all(10),
                            color: basicCss.basicColorSmother,
                            child: const Text('Detalhes do evento',
                                style: TextStyle(fontSize: 30)))),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const NavigationMenu());
  }
}
