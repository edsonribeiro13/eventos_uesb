// ignore_for_file: camel_case_types, file_names
import 'package:eventos_uesb/utils/repository/Querys.dart';

class Events {
  static List<Object?> events = [{}];
  static String filterClause = 'data';
  static String cidade = '';
  static String filter = '';
  static Object eventDetailed = {};

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
}
