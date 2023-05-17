// ignore_for_file: camel_case_types, file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventos_uesb/utils/repository/Querys.dart';
import 'package:eventos_uesb/utils/store/UserStore.dart';

class Events {
  static List<Object?> events = [{}];
  static String filterClause = 'data';
  static String cidade = '';
  static String filter = '';
  static Object eventDetailed = {};
  static bool userIsAdmin = false;
  static List collaborators = [];
  static List manager = [];
  static String id = '';
  static bool userIsManager = false;
  static bool userIsCollaborator = false;
  static bool telaCriarEvento = false;
  static List usersToHomologate = [];

  static getAllEvents(eventName) async {
    Querys query = Querys();
    cidade = eventName;

    events = await query.getEvents(eventName);
  }

  static getAllEventNotSubscribed(eventName, cpf) async {
    Querys query = Querys();
    cidade = eventName;

    events = await query.getEventsUnsubscribed(eventName, cpf);
    if (events.isEmpty) {
      events = await query.getEvents(eventName);
    }
  }

  static setFilterClause(filter) {
    filterClause = filter.toLowerCase();
  }

  static getFilterClause() {
    return filterClause;
  }

  static setFilterValue(filterValue) {
    filter = filterValue.toUpperCase();
  }

  static filterEvent() async {
    Querys query = Querys();

    events = await query.filterEvent(cidade, filterClause, filter);
  }

  static setEventDetailed(event) {
    eventDetailed = {
      'nome': event['nome'],
      'horario': event['horario'],
      'data': event['data'],
      'departamento': event['departamento'],
      'limite': event['limite'],
      'organizador': event['organizador'],
      'local': event['local'],
      'id': event['id'],
      'verifyLimite': event['verifyLimite']
    };
  }

  static getEventDetailed() {
    return eventDetailed;
  }

  static subscribeToEvent(idEvent, cpf, verifyLimite) async {
    Querys querys = Querys();

    if (verifyLimite) {
      await querys.setHomologateDoc(idEvent, cpf);
    }
    await querys.subscribeEvent(idEvent, cpf, Events.cidade);
  }

  static retrieveUserEvents(cpf) async {
    Querys querys = Querys();
    events = await querys.retrieveUserEvents(cpf);
  }

  static retrieveUserIsAdmin(cpf) async {
    Querys querys = Querys();
    userIsAdmin = await querys.retrieveUserIsAdmin(cpf);
  }

  static retrieveUserIsManager(cpf) async {
    userIsManager = manager.contains(cpf);
  }

  static retrieveUserIsCollaborator(cpf) async {
    userIsCollaborator = collaborators.contains(cpf);
  }

  static getUserIsAdmin() {
    return userIsAdmin;
  }

  static getUserIsMager() {
    return userIsManager;
  }

  static getUserIsCollaborator() {
    return userIsCollaborator;
  }

  static insertNewEvent(eventInserted, method, oldEvent) async {
    var eventToInsert = {
      'nome': eventInserted[0].text,
      'data': eventInserted[1].text,
      'departamento': eventInserted[2].text.toUpperCase(),
      'horario': eventInserted[3].text,
      'limite': eventInserted[4].text,
      'local': eventInserted[5].text,
      'organizador': eventInserted[6].text,
      'id': Timestamp.now().seconds,
      'verifyLimite': filterClause == 'sim'
    };

    Querys querys = Querys();
    querys.insertNewEvent(
        eventToInsert, cidade, eventToInsert['nome'], method, oldEvent);
  }

  static retrieveCollaborators(idEvent) async {
    Querys querys = Querys();

    id = '$idEvent';
    collaborators =
        await querys.retrieveCollaborators('$idEvent', 'colaboradores');
  }

  static retrieveManager(idEvent) async {
    Querys querys = Querys();

    id = '$idEvent';
    manager = await querys.retrieveCollaborators('$idEvent', 'organizador');
  }

  static getCollaborators() {
    return collaborators;
  }

  static getManager() {
    return manager;
  }

  static setNewCollaborator(cpf, typeOfCollaborator) async {
    if (typeOfCollaborator == 'collaborator') {
      collaborators.add(cpf);
    } else {
      manager.add(cpf);
    }
  }

  static insertArrayOfCollaborattors(typeOfCollaborator) {
    Querys querys = Querys();

    if (typeOfCollaborator == 'collaborator') {
      querys.insertArrayOfCollaborattors(collaborators, id, 'colaboradores');
    } else {
      querys.insertArrayOfCollaborattors(manager, id, 'organizador');
    }
  }

  static removeCollaborator(collaborator, typeOfCollaborator) {
    if (typeOfCollaborator == 'collaborator') {
      collaborators.removeWhere((element) => element == collaborator);
    } else {
      manager.removeWhere((element) => element == collaborator);
    }
  }

  static setTelaCriarEvento() {
    telaCriarEvento = true;
  }

  static getTelaCriarEvento() {
    return telaCriarEvento;
  }

  static userIsHomologated(idEvent) async {
    Querys querys = Querys();
    var userCpf = await UserStore().getUser();

    var isHomologated = await querys.verifyUserInHomologated(idEvent, userCpf);

    if (isHomologated != null) {
      return false;
    }
    return true;
  }

  static retrieveUsersToHomologate(idEvent) async {
    Querys querys = Querys();
    id = '$idEvent';

    usersToHomologate = await querys.retrieveUsersToHomologate('$idEvent');
  }

  static getUsersToHomologate() {
    return usersToHomologate;
  }

  static removeUser(collaborator) {
    usersToHomologate.removeWhere((element) => element == collaborator);
  }

  static deleteUserFromHomolog(idUser) {
    Querys querys = Querys();

    querys.deleteUserFromHomolog(id, idUser);
  }

  static removeEventFromUser(idUser) {
    Querys querys = Querys();

    querys.removeEventFromUser(id, idUser, cidade);
  }
}
