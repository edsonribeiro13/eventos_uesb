// ignore_for_file: camel_case_types, file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventos_uesb/utils/repository/Querys.dart';

class Events {
  static List<Object?> events = [{}];
  static String filterClause = 'data';
  static String cidade = '';
  static String filter = '';
  static Object eventDetailed = {};
  static bool userIsAdmin = false;

  static getAllEvents(eventName) async {
    Querys query = Querys();
    cidade = eventName;

    events = await query.getEvents(eventName);
  }

  static getAllEventNotSubscribed(eventName, cpf) async {
    Querys query = Querys();
    cidade = eventName;

    events = await query.getEventsUnsubscribed(eventName, cpf);
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
      'id': event['id']
    };
  }

  static getEventDetailed() {
    return eventDetailed;
  }

  static subscribeToEvent(idEvent, cpf) async {
    Querys querys = Querys();
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

  static insertNewEvent(eventInserted) async {
    var eventToInsert = {
      'nome': eventInserted[0].text,
      'data': eventInserted[1].text,
      'departamento': eventInserted[2].text.toUpperCase(),
      'horario': eventInserted[3].text,
      'limite': eventInserted[4].text,
      'local': eventInserted[5].text,
      'organizador': eventInserted[6].text,
      'id': Timestamp.now().seconds
    };

    Querys querys = Querys();
    querys.insertNewEvent(eventToInsert, cidade, eventToInsert['nome']);
  }
}
