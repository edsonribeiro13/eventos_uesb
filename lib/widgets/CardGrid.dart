// ignore_for_file: file_names

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

    return Column(
      children: [
        GridView.count(
            crossAxisCount: 1,
            shrinkWrap: true,
            childAspectRatio: 1.3,
            padding: EdgeInsets.symmetric(
                vertical: mediaQuery.size.height / 100,
                horizontal: mediaQuery.size.width / 5),
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                GestureDetector(
                    onTap: () async => {
                          await Events.getAllEvents('itapetinga'),
                          Navigator.pushNamed(context, '/events')
                        },
                    child: Container(
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                          color: basicCss.basicColorSmother,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          iconSize: 130,
                          onPressed: null,
                          icon: Image.asset(
                              'lib/assets/images/uesb-campus-itapetinga.jpg'),
                        ))),
                ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          basicCss.basicColorSmother)),
                  onPressed: () async => {
                    await Events.getAllEvents('itapetinga'),
                    Navigator.pushNamed(context, '/events')
                  },
                  icon: const Icon(Icons.smart_button_rounded),
                  label: const Text("Eventos Itapetinga"),
                )
              ]),
              Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                GestureDetector(
                    onTap: () async => {
                          await Events.getAllEvents('jequie'),
                          Navigator.pushNamed(context, '/events')
                        },
                    child: Container(
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                            color: basicCss.basicColorSmother,
                            borderRadius: BorderRadius.circular(25)),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          iconSize: 130,
                          onPressed: null,
                          icon: Image.asset(
                              'lib/assets/images/campus-jequie.jpeg'),
                        ))),
                ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          basicCss.basicColorSmother)),
                  onPressed: () async => {
                    await Events.getAllEvents('itapetinga'),
                    Navigator.pushNamed(context, '/events')
                  },
                  icon: const Icon(Icons.smart_button_rounded),
                  label: const Text("Eventos Jequié"),
                )
              ]),
              Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                GestureDetector(
                    onTap: () async => {
                          await Events.getAllEvents('coquista'),
                          Navigator.pushNamed(context, '/events')
                        },
                    child: Container(
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                            color: basicCss.basicColorSmother,
                            borderRadius: BorderRadius.circular(25)),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          iconSize: 130,
                          onPressed: null,
                          icon: Image.asset(
                              'lib/assets/images/uesb-conquista.jpg'),
                        ))),
                ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          basicCss.basicColorSmother)),
                  onPressed: () async => {
                    await Events.getAllEvents('itapetinga'),
                    Navigator.pushNamed(context, '/events')
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
