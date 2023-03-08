// ignore_for_file: camel_case_types, file_names
import 'package:eventos_uesb/utils/repository/Querys.dart';

class Events {
  static List<Object?> events = [{}];
  static List eventSplited = [];
  static String filterClause = '';
  static String cidade = '';
  static String filter = '';
  static List eventDetailed = [];

  static getAllEvents(eventName) async {
    Querys query = Querys();
    cidade = eventName;

    events = await query.getEvents(eventName);
    Events.manipulateEventObject(events);
  }

  static setFilterClause(filter) {
    filterClause = filter;
  }

  static getFilterValue(filterValue) {
    filter = filterValue;
  }

  static filterEvent() async {
    Querys query = Querys();

    events = await query.filterEvent(cidade, filterClause, filter);
    Events.manipulateEventObject(events);
  }

  static manipulateEventObject(events) {
    eventSplited = [];

    for (var i = 0; i < events.length; i++) {
      var eventToString = events[i].toString();
      eventSplited.add(eventToString.split(','));
    }
  }

  static setEventDetailed(event) {
    eventDetailed = event;
  }

  static getEventDetailed() {
    return eventDetailed;
  }
}
