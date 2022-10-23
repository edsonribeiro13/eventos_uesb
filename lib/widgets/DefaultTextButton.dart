// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DefaultTextButton extends StatelessWidget {
  const DefaultTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: null,
          style: TextButton.styleFrom(
              textStyle: const TextStyle(
                  color: Colors.white, fontSize: 15, fontFamily: 'arial')),
          child: const Text("Validar Certificado"),
        )
      ],
    );
  }
}
