import 'package:emp/screens/musicPlayer/musicPlayer.dart';
import 'package:flutter/material.dart';

class SongItem extends StatelessWidget {
  final title;
  final artist;
  final image;
  final songLink;
  SongItem(this.title, this.artist, this.image, this.songLink);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  musicPlayer(title, artist, image, songLink)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 26.0),
        child: Row(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 80.0,
                  width: 80.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                    height: 80.0,
                    width: 80.0,
                    child: Icon(
                      Icons.play_circle_filled,
                      color: Colors.white.withOpacity(0.7),
                      size: 42.0,
                    ))
              ],
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    artist,
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.5), fontSize: 16.0),
                  ),
                ],
              ),
            ),
            Spacer(),
            Icon(
              Icons.more_horiz,
              color: Colors.white.withOpacity(0.6),
              size: 32.0,
            )
          ],
        ),
      ),
    );
  }
}
