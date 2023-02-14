import 'package:flutter/material.dart';
import 'package:eventos_uesb/routes/Routes.dart';
import 'package:eventos_uesb/utils/repository/Querys.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  Querys().ddl();
  runApp(Routes().createRouteTable());
}
