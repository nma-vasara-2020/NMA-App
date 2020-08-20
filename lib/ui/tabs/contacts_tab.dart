import 'package:flutter/material.dart';
import 'package:movies/models/contact.dart';
import 'package:url_launcher/url_launcher.dart';

class ContTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ContactList(),
    );
  }
}

class ContactList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Numer.NUMER.length,
      itemBuilder: (context, index) {
        final cont = Numer.NUMER[index];
        return ListTile(
          leading: Icon(Icons.phone_iphone),
          title: Text(cont.name),
          subtitle: Text(cont.nomer),
          trailing: Text(cont.seck),
          onTap: () => launch("tel://${cont.nomer}"),
        );
      },
    );
  }
}
