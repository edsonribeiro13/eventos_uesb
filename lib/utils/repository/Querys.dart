// ignore_for_file: non_constant_identifier_names, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventos_uesb/utils/repository/DbConnection.dart';

class Querys {
  createNewUser(nome, CPF, senha) async {
    final login = {'nome': nome, 'cpf': CPF, 'senha': senha};
    var db = await DbConnection().getFirestoreInstance();
    db.collection('/login').doc(CPF).set(login);
  }

  searchUser(CPF, senha) async {
    var db = await DbConnection().getFirestoreInstance();
    final docRef = db.collection('login').where('senha', isEqualTo: senha);
    final result = await docRef.get().then(
      (QuerySnapshot querySnapshot) {
        final data = querySnapshot.docs.map((doc) => doc.data()).toList();
        return data;
      },
      onError: (e) => print("Error getting document: $e"),
    );
    return result;
  }

  getEvents(cidade) async {
    var db = await DbConnection().getFirestoreInstance();
    return await db
        .collection('/$cidade')
        .get()
        .then((QuerySnapshot querySnapshot) {
      final data = querySnapshot.docs.map((doc) => doc.data()).toList();
      return data;
    });
  }
}
