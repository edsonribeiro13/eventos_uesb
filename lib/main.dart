import 'package:flutter/material.dart';
import 'package:eventos_uesb/routes/Routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

main() async {
  runApp(Routes().createRouteTable());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
}
