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

  getEventsUnsubscribed(cidade, user) async {
    var eventsPerUser = [];
    var eventsIdPerCity = [];

    var db = await DbConnection().getFirestoreInstance();

    final eventsId = await db
        .collection('/meusEventos')
        .doc(user)
        .collection('cidade')
        .doc('$cidade')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      return documentSnapshot.data();
    });
    if (eventsId != null && eventsId.isNotEmpty) {
      for (var idEvent in eventsId.values) {
        eventsIdPerCity.add(idEvent);
      }
      if (eventsIdPerCity.isNotEmpty) {
        var docRef = await db
            .collection('/$cidade')
            .where('id', whereNotIn: eventsIdPerCity);

        var result = await docRef.get().then(
          (QuerySnapshot querySnapshot) {
            final data = querySnapshot.docs.map((doc) => doc.data()).toList();
            return data;
          },
          onError: (e) => print("Error getting document: $e"),
        );

        result.forEach((element) {
          eventsPerUser.add(element);
        });
      }
    }

    return eventsPerUser;
  }

  filterEvent(cidade, filtro, valorFiltro) async {
    var db = await DbConnection().getFirestoreInstance();
    var docRef =
        await db.collection('/$cidade').where(filtro, isEqualTo: valorFiltro);
    final result = await docRef.get().then(
      (QuerySnapshot querySnapshot) {
        final data = querySnapshot.docs.map((doc) => doc.data()).toList();
        return data;
      },
      onError: (e) => print("Error getting document: $e"),
    );
    return result;
  }

  subscribeEvent(idEvent, cpf, cidade) async {
    final subscribe = {'$idEvent': idEvent};
    var db = await DbConnection().getFirestoreInstance();
    try {
      await db
          .collection('/meusEventos')
          .doc(cpf)
          .collection('/cidade')
          .doc('/$cidade')
          .update(subscribe);
    } catch (e) {
      db
          .collection('/meusEventos')
          .doc(cpf)
          .collection('/cidade')
          .doc('/$cidade')
          .set(subscribe);
    }
  }

  retrieveUserEvents(cpf) async {
    var db = await DbConnection().getFirestoreInstance();
    var eventsIdPerCity = [];
    var eventsPerUser = [];

    final idEventsItapetinga = await db
        .collection('/meusEventos')
        .doc(cpf)
        .collection('cidade')
        .doc('itapetinga')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      return documentSnapshot.data();
    });
    if (idEventsItapetinga != null && idEventsItapetinga.isNotEmpty) {
      for (var idItapetinga in idEventsItapetinga.values) {
        eventsIdPerCity.add(idItapetinga);
      }
      if (eventsIdPerCity.isNotEmpty) {
        var docRef = await db
            .collection('/itapetinga')
            .where('id', whereIn: eventsIdPerCity);

        var result = await docRef.get().then(
          (QuerySnapshot querySnapshot) {
            final data = querySnapshot.docs.map((doc) => doc.data()).toList();
            return data;
          },
          onError: (e) => print("Error getting document: $e"),
        );

        result.forEach((element) {
          eventsPerUser.add(element);
        });
      }
    }

    eventsIdPerCity = [];
    final idEventsJequie = await db
        .collection('/meusEventos')
        .doc(cpf)
        .collection('cidade')
        .doc('jequie')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      return documentSnapshot.data();
    });
    if (idEventsJequie != null && idEventsJequie.isNotEmpty) {
      for (var idJequie in idEventsJequie.values) {
        eventsIdPerCity.add(idJequie);
      }
      var docRef =
          await db.collection('/jequie').where('id', whereIn: eventsIdPerCity);

      var result = await docRef.get().then(
        (QuerySnapshot querySnapshot) {
          final data = querySnapshot.docs.map((doc) => doc.data()).toList();
          return data;
        },
        onError: (e) => print("Error getting document: $e"),
      );

      result.forEach((element) {
        eventsPerUser.add(element);
      });
    }

    eventsIdPerCity = [];
    final idEventsConquista = await db
        .collection('/meusEventos')
        .doc(cpf)
        .collection('cidade')
        .doc('conquista')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      return documentSnapshot.data();
    });
    if (idEventsConquista != null && idEventsConquista.isNotEmpty) {
      for (var idConquista in idEventsConquista.values) {
        eventsIdPerCity.add(idConquista);
      }
      if (eventsIdPerCity.isNotEmpty) {
        var docRef = await db
            .collection('/conquista')
            .where('id', whereIn: eventsIdPerCity);

        var result = await docRef.get().then(
          (QuerySnapshot querySnapshot) {
            final data = querySnapshot.docs.map((doc) => doc.data()).toList();
            return data;
          },
          onError: (e) => print("Error getting document: $e"),
        );

        result.forEach((element) {
          eventsPerUser.add(element);
        });
      }
    }

    return eventsPerUser;
  }
}
