import 'package:flutter/material.dart';

class CardGrid extends StatelessWidget {
  const CardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Center(
      child: GridView.count(
          crossAxisCount: 1,
          shrinkWrap: true,
          childAspectRatio: 1.25,
          padding: EdgeInsets.symmetric(
              vertical: mediaQuery.size.height / 20,
              horizontal: mediaQuery.size.width / 5),
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(128, 186, 63, 197)),
                  child: IconButton(
                    iconSize: 130,
                    onPressed: null,
                    icon: Image.asset(
                        'lib/assets/images/uesb-campus-itapetinga.jpg'),
                  )),
              ElevatedButton.icon(
                onPressed: null,
                icon: const Icon(Icons.smart_button_rounded),
                label: const Text("Eventos Itapetinga"),
              )
            ]),
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(128, 186, 63, 197)),
                  child: IconButton(
                    iconSize: 130,
                    onPressed: null,
                    icon: Image.asset('lib/assets/images/campus-jequie.jpeg'),
                  )),
              ElevatedButton.icon(
                onPressed: null,
                icon: const Icon(Icons.smart_button_rounded),
                label: const Text("Eventos Jequié"),
              )
            ]),
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(128, 186, 63, 197)),
                  child: IconButton(
                    iconSize: 130,
                    onPressed: null,
                    icon: Image.asset('lib/assets/images/uesb-conquista.jpg'),
                  )),
              ElevatedButton.icon(
                onPressed: null,
                icon: const Icon(Icons.smart_button_rounded),
                label: const Text("Eventos Conquista"),
              )
            ])
          ]),
    );
  }
}
