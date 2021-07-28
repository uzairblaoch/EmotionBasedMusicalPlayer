import 'package:audioplayers/audioplayers.dart';
import 'package:emp/layout/SizeConfig.dart';
import 'package:emp/screens/musicPlayer/musicPlayer.dart';
import 'package:flutter/material.dart';

class SongItem extends StatefulWidget {
  final title;
  final artist;
  final image;
  final songLink;
  SongItem(this.title, this.artist, this.image, this.songLink);

  @override
  _SongItemState createState() => _SongItemState();
}

class _SongItemState extends State<SongItem> {
  AudioPlayer audioPlayer;
  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => musicPlayer(audioPlayer, widget.title,
                  widget.artist, widget.image, widget.songLink)),
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
                      widget.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                    height: SizeConfig.screenHeight * 0.11,
                    width: SizeConfig.screenWidth * 0.18,
                    child: Icon(
                      Icons.play_circle_filled,
                      color: Colors.white.withOpacity(0.7),
                      size: SizeConfig.screenWidth * 0.11,
                    ))
              ],
            ),
            SizedBox(width: SizeConfig.screenWidth * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.title,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: SizeConfig.screenWidth * 0.04,
                        ),
                  ),
                  SizedBox(height: SizeConfig.screenWidth * 0.02),
                  Text(
                    widget.artist,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.caption.copyWith(
                          fontSize: SizeConfig.screenWidth * 0.035,
                        ),
                  ),
                ],
              ),
            ),
            Spacer(),
            /*Icon(
              Icons.more_horiz,
              color: Colors.white.withOpacity(0.6),
              size: 32.0,
            )*/
          ],
        ),
      ),
    );
  }
}
