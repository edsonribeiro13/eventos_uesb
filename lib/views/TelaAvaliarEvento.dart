// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:eventos_uesb/assets/css/BasicCSS.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// ignore: camel_case_types, must_be_immutable
class TelaAvaliarEvento extends StatelessWidget {
  const TelaAvaliarEvento({super.key});

  @override
  Widget build(BuildContext context) {
    BasicCss basicCss = BasicCss();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: basicCss.iniatilzeDefaultBackground(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'lib/assets/images/uesb-logo.png',
                scale: 3,
              ),
              const TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 6,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    label: Text('Avaliar Evento')),
              ),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              ),
              TextButton(
                  onPressed: null,
                  style: TextButton.styleFrom(
                      backgroundColor: basicCss.basicColorSmother,
                      foregroundColor: basicCss.basicColor,
                      textStyle:
                          const TextStyle(fontSize: 20, fontFamily: 'arial')),
                  child: const Text('Cadastrar-se'))
            ],
          ),
        ));
  }
}
