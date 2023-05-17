// ignore_for_file: non_constant_identifier_names, file_names, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventos_uesb/utils/repository/DbConnection.dart';

class Querys {
  createNewUser(nome, CPF, senha) async {
    final login = {'nome': nome, 'cpf': CPF, 'senha': senha, 'isAdmin': false};
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

    try {
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
    } catch (e) {
      return [];
    }
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

  setHomologateDoc(idEvent, cpf) async {
    final subscribe = {'$cpf': cpf};
    var db = await DbConnection().getFirestoreInstance();
    try {
      await db.collection('/homologar').doc('$idEvent').update(subscribe);
    } catch (e) {
      db.collection('/homologar').doc('$idEvent').set(subscribe);
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

  retrieveUserIsAdmin(cpf) async {
    var db = await DbConnection().getFirestoreInstance();
    var docRef = await db.collection('/login').where('cpf', isEqualTo: cpf);
    final result = await docRef.get().then(
      (QuerySnapshot querySnapshot) {
        final data = querySnapshot.docs.map((doc) => doc.data()).toList();
        return data;
      },
      onError: (e) => print("Error getting document: $e"),
    );
    return result[0]['isAdmin'];
  }

  insertNewEvent(eventInserted, cidade, title, method, oldEvent) async {
    var db = await DbConnection().getFirestoreInstance();

    if (method == 'update') {
      await db.collection('$cidade').doc('$oldEvent').delete();
      db.collection('$cidade').doc('$title').set(eventInserted);
    } else {
      db.collection('$cidade').doc('$title').set(eventInserted);
    }
  }

  retrieveCollaborators(idEvent, colec) async {
    var db = await DbConnection().getFirestoreInstance();
    var collaboratorsResult;
    var collaborators = [];

    try {
      collaboratorsResult = await db
          .collection(colec)
          .doc(idEvent)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        return documentSnapshot.data();
      });

      if (collaboratorsResult != null && collaboratorsResult.isNotEmpty) {
        for (var collab in collaboratorsResult.values) {
          collaborators = collab;
        }
      }
    } catch (e) {
      print(e);
      collaborators = [];
    }

    return collaborators;
  }

  retrieveUsersToHomologate(idEvent) async {
    var db = await DbConnection().getFirestoreInstance();
    var users;
    var usersToHomologate = [];

    try {
      users = await db
          .collection('homologar')
          .doc(idEvent)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        return documentSnapshot.data();
      });

      if (users != null && users.isNotEmpty) {
        for (var collab in users.values) {
          usersToHomologate.add(collab);
        }
      }
    } catch (e) {
      print(e);
      usersToHomologate = [];
    }

    return usersToHomologate;
  }

  insertArrayOfCollaborattors(collaborators, idEvent, colec) async {
    var db = await DbConnection().getFirestoreInstance();

    try {
      await db.collection(colec).doc(idEvent).update({'cpf': collaborators});
    } catch (e) {
      await db.collection(colec).doc(idEvent).set({'cpf': collaborators});
    }
  }

  verifyUserInHomologated(eventId, userId) async {
    var db = await DbConnection().getFirestoreInstance();

    final docRef = await db.collection('/homologar').doc('$eventId');

    final result = await docRef.get().then((DocumentSnapshot documentSnapshot) {
      return documentSnapshot.data();
    });

    var userIndex = userId['idUser'];

    return result[userIndex];
  }

  deleteUserFromHomolog(eventId, idUser) async {
    var db = await DbConnection().getFirestoreInstance();
    await db
        .collection('/homologar')
        .doc('$eventId')
        .update({'$idUser': FieldValue.delete()});
  }

  removeEventFromUser(eventId, idUser, city) async {
    var db = await DbConnection().getFirestoreInstance();
    await db
        .collection('/meusEventos')
        .doc('$idUser')
        .collection('/cidade')
        .doc('$city')
        .update({'$eventId': FieldValue.delete()});
  }
}
