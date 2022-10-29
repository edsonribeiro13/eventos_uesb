// ignore_for_file: file_names

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
                Card(
                    color: basicCss.greyTone,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Text(
                      "MEUS\nCERTIFICADOS",
                      style: GoogleFonts.oswald(fontSize: 35),
                    )),
                Card(
                    color: basicCss.greyTone,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Text(
                      "ALTERAR DADOS",
                      style: GoogleFonts.oswald(fontSize: 38),
                    )),
                Card(
                    color: basicCss.greyTone,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Text(
                      "MEUS EVENTOS",
                      style: GoogleFonts.oswald(fontSize: 38),
                    )),
              ],
            )),
      ),
    );
  }
}
