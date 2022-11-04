// ignore_for_file: file_names

import 'package:localstore/localstore.dart';

class UserStore {
  getInstance() {
    return Localstore.instance;
  }

  getUser() {
    var db = getInstance();
    return db.collection('users').get();
  }

  addUser(idUser) {
    var db = getInstance();
    var id = db.collection('users').doc().id;
    return db.collection('user').doc(id).set({'idUser': idUser});
  }

  deleteUser() {
    var items = getUser();
  }
}
