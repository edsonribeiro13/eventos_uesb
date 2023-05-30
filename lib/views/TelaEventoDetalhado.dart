// ignore_for_file: file_names

import 'package:eventos_uesb/domain/Events.dart';
import 'package:eventos_uesb/assets/css/BasicCSS.dart';
import 'package:flutter/material.dart';
import 'package:eventos_uesb/widgets/NavigationMenu.dart';
import 'package:eventos_uesb/utils/store/UserStore.dart';
import 'package:eventos_uesb/controller/ControllerTelaEventoDetalhado.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TelaEventoDetalhado extends State<TelaEventoDetalhadoState> {
  String buttonText = 'Inscreva-se no evento';
  var event = Events.getEventDetailed();
  bool subscribed = true;
  var isHomologated = false;
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
      if (event['verifyLimite'] != null) {
        buttonText = event['verifyLimite']
            ? isHomologated
                ? 'Inscrito!'
                : 'Aguardando validação'
            : 'Inscrito!';
        subscribed = true;
      }
    } else {
      buttonText = 'Inscreva-se no evento';
      subscribed = false;
    }
    setIsHomologated();
    super.initState();
  }

  setIsHomologated() async {
    if (event['verifyLimit'] != null && event['verifyLimit']) {
      isHomologated = await Events.userIsHomologated(event['id']);
      setState(() {
        buttonText = event['verifyLimite']
            ? isHomologated
                ? 'Inscrito!'
                : 'Aguardando validação'
            : 'Inscrito!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    BasicCss basicCss = BasicCss();
    MediaQueryData mediaQuery = MediaQuery.of(context);
    var userCpf = {};
    var userIsAdmin = Events.getUserIsAdmin();
    var userIsManager = Events.getUserIsMager();
    var userIsCollaborator = Events.getUserIsCollaborator();

    return Scaffold(
        floatingActionButton:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton.icon(
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
                      ? {
                          Events.setTelaCriarEvento(),
                          Navigator.pushNamed(context, '/RegisterEvent')
                        }
                      : Navigator.pop(context),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(basicCss.basicColorSmother))),
          userIsCollaborator
              ? ElevatedButton.icon(
                  icon: const Icon(Icons.checklist),
                  label: const Text('Validar presença'),
                  onPressed: () async =>
                      {Navigator.pushNamed(context, '/validarPresença')},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          basicCss.basicColorSmother)))
              : const Text(''),
        ]),
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
                    padding: EdgeInsets.only(top: mediaQuery.size.height / 30),
                    child: !userIsCollaborator && !userIsManager && !userIsAdmin
                        ? subscribed
                            ? QrImageView(
                                data: event['id'],
                                version: QrVersions.auto,
                                size: 120.0,
                              )
                            : ElevatedButton.icon(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        basicCss.basicColor)),
                                onPressed: () async => {
                                      if (!subscribed)
                                        {
                                          if (await UserStore().getUser() !=
                                              null)
                                            {
                                              userCpf =
                                                  await UserStore().getUser(),
                                              Events.subscribeToEvent(
                                                  event['id'],
                                                  userCpf['idUser'],
                                                  event['verifyLimite']),
                                              if (event['verifyLimite'])
                                                {
                                                  isHomologated = await Events
                                                      .userIsHomologated(
                                                          event['id'])
                                                },
                                              setState(() {
                                                buttonText = event[
                                                        'verifyLimite']
                                                    ? isHomologated
                                                        ? 'Inscrito!'
                                                        : 'Aguardando validação'
                                                    : 'Inscrito!';
                                                subscribed = true;
                                              })
                                            }
                                          else
                                            {
                                              Navigator.pushNamed(
                                                  context, '/login')
                                            }
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
