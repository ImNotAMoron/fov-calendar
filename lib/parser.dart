import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:icalendar_parser/icalendar_parser.dart';
import 'package:http/http.dart' as http;

class Event {
  String summary;
  DateTime dt;
  String location;
  Event(this.dt, this.summary, this.location);
}

class DBEvent {
  String summary;
  String dt;
  String location;
  DBEvent(this.dt, this.summary, this.location);
}

final tmp = <String>[];

Future<List<String>> fetchEventLines(String group) async {
  final url = 'https://urnik.fov.um.si/Program/calendars/$group.ics';
  final result = await http.get(Uri.parse(url));
  List<String> lines = const LineSplitter().convert(utf8.decode(result.bodyBytes));
  return lines;
}

Future<List<Event>> parseEvents(List<String> lines) async {
  var events = <Event>[];
  final icsObj = ICalendar.fromLines(lines);
  final json = icsObj.toJson();
  for(final event in json["data"]) {
    if(event["type"] == "VEVENT") {
      events.add(Event(DateTime.parse(event["dtstart"]["dt"]), event["summary"], event["location"]));
    }
  }
  return events;
}

Future<List<Event>> fetchEvents(String group) async {
  final url = 'https://urnik.fov.um.si/Program/calendars/$group.ics';
  var events = <Event>[];
  final result = await http.get(Uri.parse(url));
  List<String> lines = LineSplitter().convert(utf8.decode(result.bodyBytes));
  final icsObj = ICalendar.fromLines(lines);
  final json = icsObj.toJson();
  for(final event in json["data"]) {
    if(event["type"] == "VEVENT") {
      events.add(Event(DateTime.parse(event["dtstart"]["dt"]), event["summary"], event["location"]));
    }
  }
  return events;
}

Future<List<Event>> getEvents() async {
  var events = <Event>[];
  final data = await rootBundle.loadString('assets/test.ics');
  List<String> lines = LineSplitter().convert(data);
  final icsObj = ICalendar.fromLines(lines);
  final json = icsObj.toJson();
  for(final event in json["data"]) {
    if(event["type"] == "VEVENT") {
      events.add(Event(DateTime.parse(event["dtstart"]["dt"]), event["summary"], event["location"]));
    }
  }
  return events;
}

// {type: VALARM, action: DISPLAY, trigger: -PT30M, description: V-Kadri in upravljanje kritične infrastrukture-VS-2}
// {type: VEVENT, summary: V-Kadri in upravljanje kritične infrastrukture-VS-Redni, dtstart: {dt: 20250106T104500, tzid: "Central Europe"}
