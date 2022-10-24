// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:eventos_uesb/views/PagIni.dart';
import 'package:eventos_uesb/views/TelaLogin.dart';

class Routes extends StatelessWidget {
  const Routes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => pagIni(),
        '/login': (context) => const TelaLogin()
      },
    );
  }
}
