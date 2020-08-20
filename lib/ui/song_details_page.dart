import 'package:flutter/material.dart';
import 'package:movies/models/song.dart';

class SongDetailsPage extends StatelessWidget {
  final Song song;

  const SongDetailsPage({Key key, @required this.song})
      : assert(song != null, "Please pass a song as an argument"),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(song.name),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(song.words),
          ),
        ));
  }
}
