// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:eventos_uesb/views/PagIni.dart';
import 'package:eventos_uesb/controller/ControllerTelaLogin.dart';
import 'package:eventos_uesb/controller/ControllerTelaCadastro.dart';
import 'package:eventos_uesb/views/PagUsuario.dart';
import 'package:eventos_uesb/views/TelaValidarCertificado.dart';
import 'package:eventos_uesb/views/TelaCertificados.dart';
import 'package:eventos_uesb/views/TelaRecuperarSenha.dart';
import 'package:eventos_uesb/views/TelaValidarRecuperarSenha.dart';
import 'package:eventos_uesb/views/TelaEventos.dart';
import 'package:eventos_uesb/views/TelaAvaliarEvento.dart';

class Routes {
  createRouteTable() {
    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) => pagIni(),
      '/login': (context) => const ControllerTelaLogin(),
      '/cadastro': (context) => const ControllerTelaCadastro(),
      '/usuario': (context) => const PagUsuario(),
      '/validate': (context) => const TelaValidarCertificado(),
      '/certificates': (context) => TelaCertificados(),
      '/retrieve': (context) => const TelaRecuperarSenha(),
      '/retrievevalidate': (context) => const TelaValidarRecuperarSenha(),
      '/events': (context) => TelaEventos(),
      '/rateEvent': (context) => const TelaAvaliarEvento()
    });
  }
}
