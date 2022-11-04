import 'package:flutter/material.dart';
import 'package:eventos_uesb/routes/Routes.dart';
import 'package:eventos_uesb/utils/repository/Querys.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Querys().ddl();
  runApp(Routes().createRouteTable());
}
