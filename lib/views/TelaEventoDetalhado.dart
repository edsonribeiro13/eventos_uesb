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
            padding: const EdgeInsets.only(top: 70),
            decoration: basicCss.iniatilzeDefaultBackground(),
            child: Column(
              children: [
                Card(
                    child: ListTile(
                        leading: const Icon(Icons.title),
                        title: Text(
                          event[3],
                          style: const TextStyle(fontSize: 25),
                        ))),
                Card(
                    child: ListTile(
                        leading: const Icon(Icons.timelapse),
                        title: Text(
                          event[0].replaceAll('{', ''),
                          style: const TextStyle(fontSize: 25),
                        ))),
                Card(
                    child: ListTile(
                        leading: const Icon(Icons.date_range),
                        title: Text(
                          event[1],
                          style: const TextStyle(fontSize: 25),
                        ))),
                Card(
                    child: ListTile(
                        leading: const Icon(Icons.biotech),
                        title: Text(
                          event[2],
                          style: const TextStyle(fontSize: 25),
                        ))),
                Card(
                    child: ListTile(
                        leading: const Icon(Icons.public),
                        title: Text(
                          event[4],
                          style: const TextStyle(fontSize: 25),
                        ))),
                Card(
                    child: ListTile(
                        leading: const Icon(Icons.people),
                        title: Text(
                          event[5],
                          style: const TextStyle(fontSize: 25),
                        ))),
                Card(
                    child: ListTile(
                        leading: const Icon(Icons.emoji_people),
                        title: Text(
                          event[6],
                          style: const TextStyle(fontSize: 25),
                        ))),
                Card(
                    child: ListTile(
                        leading: const Icon(Icons.place),
                        title: Text(
                          event[7].replaceAll('}', ''),
                          style: const TextStyle(fontSize: 25),
                        ))),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const NavigationMenu());
  }
}
