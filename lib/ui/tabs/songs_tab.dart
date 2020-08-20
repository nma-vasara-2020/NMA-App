import 'package:flutter/material.dart';
import 'package:movies/models/song.dart';
import 'package:movies/routes.dart';

class SongsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SongList(),
    );
  }
}

class SongList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Song.SONGS.length,
      itemBuilder: (context, index) {
        final song = Song.SONGS[index];
        return ListTile(
          leading: Icon(Icons.music_note),
          title: Text(song.name),
          subtitle: Text(song.author),
          onTap: () {
            Navigator.of(context).pushNamed(
              Routes.ROUTE_SONG_DETAILS,
              arguments: song,
            );
          },
        );
      },
    );
  }
}
