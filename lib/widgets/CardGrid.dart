import 'package:flutter/material.dart';
import 'package:eventos_uesb/assets/css/BasicCSS.dart';

class CardGrid extends StatelessWidget {
  const CardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    BasicCss basicCss = BasicCss();

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
                  )),
              ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(basicCss.basicColorSmother)),
                onPressed: null,
                icon: const Icon(Icons.smart_button_rounded),
                label: const Text("Eventos Itapetinga"),
              )
            ]),
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                  decoration: BoxDecoration(
                      color: basicCss.basicColorSmother,
                      borderRadius: BorderRadius.circular(25)),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 130,
                    onPressed: null,
                    icon: Image.asset('lib/assets/images/campus-jequie.jpeg'),
                  )),
              ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(basicCss.basicColorSmother)),
                onPressed: null,
                icon: const Icon(Icons.smart_button_rounded),
                label: const Text("Eventos Jequié"),
              )
            ]),
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                  decoration: BoxDecoration(
                      color: basicCss.basicColorSmother,
                      borderRadius: BorderRadius.circular(25)),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 130,
                    onPressed: null,
                    icon: Image.asset('lib/assets/images/uesb-conquista.jpg'),
                  )),
              ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(basicCss.basicColorSmother)),
                onPressed: null,
                icon: const Icon(Icons.smart_button_rounded),
                label: const Text("Eventos Conquista"),
              )
            ])
          ]),
    );
  }
}
