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
import 'package:eventos_uesb/views/TelaFiltro.dart';
import 'package:eventos_uesb/views/TelaEventoDetalhado.dart';

class Routes {
  createRouteTable() {
    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) => pagIni(),
      '/login': (context) => const ControllerTelaLogin(),
      '/cadastro': (context) => const ControllerTelaCadastro(),
      '/usuario': (context) => const PagUsuario(),
      '/validate': (context) => const TelaValidarCertificado(),
      '/certificates': (context) => const TelaCertificados(),
      '/retrieve': (context) => const TelaRecuperarSenha(),
      '/retrievevalidate': (context) => const TelaValidarRecuperarSenha(),
      '/events': (context) => const TelaEventos(),
      '/rateEvent': (context) => const TelaAvaliarEvento(),
      '/filtrar': (context) => const TelaFiltro(),
      '/eventDetails': (context) => const TelaEventoDetalhado()
    });
  }
}
