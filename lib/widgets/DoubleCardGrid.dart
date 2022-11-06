// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:eventos_uesb/assets/css/BasicCSS.dart';

class DoubleCardGrid extends StatelessWidget {
  const DoubleCardGrid({super.key, required this.botaoNome});

  final String botaoNome;

  @override
  build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    BasicCss basicCss = BasicCss();

    return GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        childAspectRatio: 1,
        padding: EdgeInsets.symmetric(
            vertical: mediaQuery.size.height / 100, horizontal: 0),
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: basicCss.basicColorSmother,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 130,
                  onPressed: null,
                  icon: Icon(Icons.person_rounded),
                )),
            ElevatedButton.icon(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(basicCss.basicColorSmother)),
              onPressed: null,
              icon: const Icon(Icons.smart_button_rounded),
              label: Text(botaoNome),
            )
          ]),
          Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: basicCss.basicColorSmother,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 130,
                  onPressed: null,
                  icon: Icon(Icons.person_rounded),
                )),
            ElevatedButton.icon(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(basicCss.basicColorSmother)),
              onPressed: null,
              icon: const Icon(Icons.smart_button_rounded),
              label: Text(botaoNome),
            )
          ])
        ]);
  }
}
