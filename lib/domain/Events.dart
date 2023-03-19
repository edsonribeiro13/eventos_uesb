// ignore_for_file: camel_case_types, file_names
import 'package:eventos_uesb/utils/repository/Querys.dart';

class Events {
  static List<Object?> events = [{}];
  static String filterClause = '';
  static String cidade = '';
  static String filter = 'data';
  static Object eventDetailed = {};

  static getAllEvents(eventName) async {
    Querys query = Querys();
    cidade = eventName;

    events = await query.getEvents(eventName);
  }

  static setFilterClause(filter) {
    filterClause = filter.toLowerCase();
  }

  static getFilterClause() {
    return filterClause;
  }

  static setFilterValue(filterValue) {
    filter = filterValue;
  }

  static filterEvent() async {
    Querys query = Querys();

    print(cidade);
    print(filterClause);
    print(filter);

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
      'local': event['local']
    };
  }

  static getEventDetailed() {
    return eventDetailed;
  }
}
