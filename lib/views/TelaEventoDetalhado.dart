// ignore_for_file: file_names

import 'package:eventos_uesb/domain/Events.dart';
import 'package:eventos_uesb/assets/css/BasicCSS.dart';
import 'package:flutter/material.dart';
import 'package:eventos_uesb/widgets/NavigationMenu.dart';

class TelaEventoDetalhado extends StatelessWidget {
  const TelaEventoDetalhado({super.key});

  @override
  Widget build(BuildContext context) {
    BasicCss basicCss = BasicCss();
    var event = Events.getEventDetailed();
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Scaffold(
        floatingActionButton: ElevatedButton.icon(
            icon: const Icon(Icons.arrow_back),
            label: const Text('Voltar'),
            onPressed: () => Navigator.pop(context),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(basicCss.basicColorSmother))),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
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
              ],
            ),
          ),
        ),
        bottomNavigationBar: const NavigationMenu());
  }
}
