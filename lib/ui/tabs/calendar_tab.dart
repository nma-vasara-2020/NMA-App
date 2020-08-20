import 'package:flutter/material.dart';
import 'package:movies/api/movies_api_service.dart';
import 'package:movies/models/genre.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/ui/widgets/error_indicator.dart';
import 'package:movies/ui/widgets/loading_indicator.dart';
import 'package:movies/ui/widgets/movies_list.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../routes.dart';

class CalendarTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CalendarTabState();
  }
}

// App state https://flutter.dev/docs/development/ui/interactive
class CalendarTabState extends State<CalendarTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: EventList(),
    );
  }
}

class EventList extends StatelessWidget {
  final List<Event> events = [
    Event(DateTime(2020), "Pirmas", "Pirmas d"),
    Event(DateTime(2010), "Antras", "Antras d"),
    Event(DateTime(2011), "Trecias", "Trecias d"),
    Event(DateTime(1000), "Ketvirtas", "Ketvirtas d"),
  ];
  @override
  Widget build(BuildContext context) {
    if (events.length > 0) {
      List<DateTime> datos = new List();
      for (int i = 0; i < events.length; i++) {
        bool yra = false;
        for (int j = 0; j < datos.length; j++) {
          if (events[i].time.year == datos[j].year &&
              events[i].time.month == datos[j].month &&
              events[i].time.day == datos[j].day) {
            yra = true;
          }
        }
        if (!yra) {
          datos.add(DateTime(
              events[i].time.year, events[i].time.month, events[i].time.day));
        }
      }
      for (int i = 0; i < datos.length; i++) {
        events.add(Event(datos[i], null, null));
      }
      events.sort((Event a, Event b) => compareEvents(a, b));
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        return EventListViewCell(
          event: events[index],
        );
      },
      itemCount: events.length,
    );
  }

  compareEvents(Event a, Event b) {
    if (a.time == b.time) {
      if (a.title == null) {
        return -1;
      }
      return 1;
    }
    return a.time.compareTo(b.time);
  }
}

class EventListViewCell extends StatelessWidget {
  final event;

  const EventListViewCell({Key key, @required this.event})
      : assert(event != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (event.title == null) {
      return ListTile(
        title: Text(
          DateFormat('yyyy-MM-dd').format(event.time),
          style: TextStyle(fontSize: 25),
          textAlign: TextAlign.center,
        ),
      );
    }
    return ListTile(
      leading: Icon(
        Icons.check_circle,
        color: Colors.black12,
      ),
      title: Text(event.title),
      subtitle: Text(event.time.toString()),
      onTap: () => launchEventDetailScreen(context),
    );
  }

  launchEventDetailScreen(BuildContext context) {
    Navigator.pushNamed(
      context,
      Routes.ROUTE_EVENT_DETAILS,
      arguments: event,
    );
  }
}

class Event {
  final DateTime time;
  final String title, description;

  const Event(
    this.time,
    this.title,
    this.description,
  );
}
//
//abstract class ListItem {
//  /// The title line to show in a list item.
//  Widget buildTitle(BuildContext context);
//
//  /// The subtitle line, if any, to show in a list item.
//  Widget buildSubtitle(BuildContext context);
//}
////
//class HeadingItem implements ListItem {
//  final String heading;
//
//  HeadingItem(this.heading);
//
//  Widget buildTitle(BuildContext context) {
//    return Text(
//      heading,
//      style: Theme.of(context).textTheme.headline5,
//    );
//  }
//
//  Widget buildSubtitle(BuildContext context) => null;
//}
//
//class EventItem implements ListItem {
//  final Event event;
//
//  EventItem(this.event);
//
//  Widget buildTitle(BuildContext context) => Text(event.title);
//
//  Widget buildSubtitle(BuildContext context) => Text(event.time.toString());
//}
