// ignore_for_file: file_names

import 'package:eventos_uesb/domain/Events.dart';
import 'package:eventos_uesb/utils/store/UserStore.dart';
import 'package:eventos_uesb/views/TelaEventoDetalhado.dart';
import 'package:flutter/material.dart';
import 'package:eventos_uesb/assets/css/BasicCSS.dart';
import 'package:eventos_uesb/widgets/NavigationMenu.dart';
import 'package:google_fonts/google_fonts.dart';

class PagUsuario extends StatelessWidget {
  const PagUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    BasicCss basicCss = BasicCss();
    var userCpf = {};

    return Scaffold(
      bottomNavigationBar: const NavigationMenu(),
      body: Center(
        child: Container(
            width: mediaQuery.size.width,
            decoration: basicCss.iniatilzeDefaultBackground(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'lib/assets/images/uesb-logo.png',
                  scale: 3,
                ),
                GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/certificates'),
                    child: Card(
                        shadowColor: basicCss.basicColor,
                        color: basicCss.basicColorSmother,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "MEUS\nCERTIFICADOS",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.oswald(fontSize: 38),
                            )))),
                Card(
                    shadowColor: basicCss.basicColor,
                    color: basicCss.basicColorSmother,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "ALTERAR DADOS",
                          style: GoogleFonts.oswald(fontSize: 38),
                        ))),
                GestureDetector(
                    onTap: () async => {
                          userCpf = await UserStore().getUser(),
                          await Events.retrieveUserEvents(userCpf['idUser']),
                          TelaEventoDetalhado.setUserPage(),
                          Navigator.pushNamed(context, '/events'),
                        },
                    child: Card(
                        shadowColor: basicCss.basicColor,
                        color: basicCss.basicColorSmother,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "MEUS EVENTOS",
                              style: GoogleFonts.oswald(fontSize: 38),
                            )))),
              ],
            )),
      ),
    );
  }
}
