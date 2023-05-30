// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DefaultTextButton extends StatelessWidget {
  const DefaultTextButton(
      {super.key, required this.textButton, required this.routeName});

  final String textButton;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, routeName);
          },
          style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              textStyle: const TextStyle(
                  color: Colors.white, fontSize: 15, fontFamily: 'arial')),
          child: Text(textButton),
        ),
      ],
    );
  }
}
