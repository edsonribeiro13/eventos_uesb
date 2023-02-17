// ignore_for_file: camel_case_types, file_names
import 'package:eventos_uesb/utils/repository/Querys.dart';

class Events {
  static List<Object?> events = [{}];
  static List eventSplited = [];

  static getAllEvents(eventName) async {
    Querys query = Querys();

    events = await query.getEvents(eventName);
    eventSplited = [];

    for (var i = 0; i < events.length; i++) {
      var eventToString = events[i].toString();
      eventSplited.add(eventToString.split(','));
    }
  }
}
