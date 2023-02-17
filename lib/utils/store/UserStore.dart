// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:localstore/localstore.dart';

class UserStore {
  getInstance() {
    WidgetsFlutterBinding.ensureInitialized();
    return Localstore.instance;
  }

  getUser() async {
    var db = getInstance();
    return await db.collection('users').get();
  }

  addUser(idUser) async {
    var db = getInstance();
    db.collection('users').doc('1').set({'idUser': idUser});
  }

  deleteUser() async {
    var db = getInstance();
    await db.collection('users').doc('1').delete();
  }
}
