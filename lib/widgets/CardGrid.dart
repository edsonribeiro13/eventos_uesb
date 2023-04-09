// ignore_for_file: file_names

import 'package:eventos_uesb/utils/store/UserStore.dart';
import 'package:eventos_uesb/views/TelaEventoDetalhado.dart';
import 'package:flutter/material.dart';
import 'package:eventos_uesb/assets/css/BasicCSS.dart';
import 'package:eventos_uesb/widgets/DefaultTextButton.dart';
import 'package:eventos_uesb/domain/Events.dart';

class CardGrid extends StatelessWidget {
  const CardGrid({super.key});

  @override
  build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    BasicCss basicCss = BasicCss();
    DefaultTextButton defaultTextButton = const DefaultTextButton(
      textButton: 'Validar Certificado',
      routeName: '/validate',
    );
    var userCpf = {};

    return Column(
      children: [
        GridView.count(
            crossAxisCount: 1,
            shrinkWrap: true,
            childAspectRatio: 1.2,
            padding: EdgeInsets.symmetric(
                vertical: mediaQuery.size.height / 12,
                horizontal: mediaQuery.size.width / 5),
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                GestureDetector(
                    onTap: () async => {
                          TelaEventoDetalhado.unsetUserPage(),
                          if (await UserStore().getUser() != null)
                            {
                              userCpf = await UserStore().getUser(),
                              await Events.retrieveUserIsAdmin(
                                  userCpf['idUser']),
                              await Events.getAllEventNotSubscribed(
                                  'itapetinga', userCpf['idUser']),
                              Navigator.pushNamed(context, '/events')
                            }
                          else
                            {
                              await Events.getAllEvents('itapetinga'),
                              TelaEventoDetalhado.unsetUserPage(),
                              Navigator.pushNamed(context, '/events')
                            }
                        },
                    child: Container(
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                          color: basicCss.basicColor,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          iconSize: 150,
                          onPressed: null,
                          icon: Image.asset(
                              'lib/assets/images/uesb-campus-itapetinga.jpg'),
                        ))),
                ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(basicCss.basicColor)),
                  onPressed: () async => {
                    TelaEventoDetalhado.unsetUserPage(),
                    if (await UserStore().getUser() != null)
                      {
                        userCpf = await UserStore().getUser(),
                        await Events.retrieveUserIsAdmin(userCpf['idUser']),
                        await Events.getAllEventNotSubscribed(
                            'itapetinga', userCpf['idUser']),
                        Navigator.pushNamed(context, '/events')
                      }
                    else
                      {
                        await Events.getAllEvents('itapetinga'),
                        TelaEventoDetalhado.unsetUserPage(),
                        Navigator.pushNamed(context, '/events')
                      }
                  },
                  icon: const Icon(Icons.smart_button_rounded),
                  label: const Text("Eventos Itapetinga"),
                )
              ]),
              Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                GestureDetector(
                    onTap: () async => {
                          TelaEventoDetalhado.unsetUserPage(),
                          if (await UserStore().getUser() != null)
                            {
                              userCpf = await UserStore().getUser(),
                              await Events.retrieveUserIsAdmin(
                                  userCpf['idUser']),
                              await Events.getAllEventNotSubscribed(
                                  'jequie', userCpf['idUser']),
                              Navigator.pushNamed(context, '/events')
                            }
                          else
                            {
                              await Events.getAllEvents('jequie'),
                              TelaEventoDetalhado.unsetUserPage(),
                              Navigator.pushNamed(context, '/events')
                            }
                        },
                    child: Container(
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                            color: basicCss.basicColor,
                            borderRadius: BorderRadius.circular(25)),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          iconSize: 150,
                          onPressed: null,
                          icon: Image.asset(
                              'lib/assets/images/campus-jequie.jpeg'),
                        ))),
                ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          basicCss.basicColorSmother)),
                  onPressed: () async => {
                    TelaEventoDetalhado.unsetUserPage(),
                    if (await UserStore().getUser() != null)
                      {
                        userCpf = await UserStore().getUser(),
                        await Events.retrieveUserIsAdmin(userCpf['idUser']),
                        await Events.getAllEventNotSubscribed(
                            'jequie', userCpf['idUser']),
                        Navigator.pushNamed(context, '/events')
                      }
                    else
                      {
                        await Events.getAllEvents('jequie'),
                        TelaEventoDetalhado.unsetUserPage(),
                        Navigator.pushNamed(context, '/events')
                      }
                  },
                  icon: const Icon(Icons.smart_button_rounded),
                  label: const Text("Eventos Jequié"),
                )
              ]),
              Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                GestureDetector(
                    onTap: () async => {
                          TelaEventoDetalhado.unsetUserPage(),
                          if (await UserStore().getUser() != null)
                            {
                              userCpf = await UserStore().getUser(),
                              await Events.retrieveUserIsAdmin(
                                  userCpf['idUser']),
                              await Events.getAllEventNotSubscribed(
                                  'conquista', userCpf['idUser']),
                              Navigator.pushNamed(context, '/events')
                            }
                          else
                            {
                              await Events.getAllEvents('conquista'),
                              TelaEventoDetalhado.unsetUserPage(),
                              Navigator.pushNamed(context, '/events')
                            }
                        },
                    child: Container(
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                            color: basicCss.basicColorSmother,
                            borderRadius: BorderRadius.circular(25)),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          iconSize: 150,
                          onPressed: null,
                          icon: Image.asset(
                              'lib/assets/images/uesb-conquista.jpg'),
                        ))),
                ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          basicCss.basicColorSmother)),
                  onPressed: () async => {
                    TelaEventoDetalhado.unsetUserPage(),
                    if (await UserStore().getUser() != null)
                      {
                        userCpf = await UserStore().getUser(),
                        await Events.retrieveUserIsAdmin(userCpf['idUser']),
                        await Events.getAllEventNotSubscribed(
                            'conquista', userCpf['idUser']),
                        Navigator.pushNamed(context, '/events')
                      }
                    else
                      {
                        await Events.getAllEvents('conquista'),
                        TelaEventoDetalhado.unsetUserPage(),
                        Navigator.pushNamed(context, '/events')
                      }
                  },
                  icon: const Icon(Icons.smart_button_rounded),
                  label: const Text("Eventos Conquista"),
                )
              ])
            ]),
        defaultTextButton
      ],
    );
  }
}
