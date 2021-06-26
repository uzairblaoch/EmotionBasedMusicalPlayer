import 'package:audio_manager/audio_manager.dart';
import 'package:flutter/material.dart';

class musicPlayer extends StatelessWidget {
  final title;
  final artist;
  final image;
  final songLink;
  musicPlayer(this.title, this.artist, this.image, this.songLink);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Column(
        children: <Widget>[
          Container(
            height: 500.0,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(image), fit: BoxFit.cover)),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.black38.withOpacity(0.4),
                      Colors.black38
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 52.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(50.0)),
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Now Playing',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
                                    fontSize: 20),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.playlist_add,
                            color: Colors.transparent,
                          )
                        ],
                      ),
                      Spacer(),
                      Text(title,
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontWeight: FontWeight.bold,
                              fontSize: 32.0)),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        artist,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 18.0),
                      ),
                      SizedBox(height: 16.0),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 42.0),
          Slider(
              onChanged: (double value) {},
              value: 0.2,
              activeColor: Colors.blue),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '2:10',
                  style: TextStyle(color: Colors.white.withOpacity(0.7)),
                ),
                Text('-03:56',
                    style: TextStyle(color: Colors.white.withOpacity(0.7)))
              ],
            ),
          ),
          SizedBox(height: 50.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.fast_rewind,
                color: Colors.white54,
                size: 42.0,
              ),
              SizedBox(width: 32.0),
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(50.0)),
                child: InkWell(
                  onTap: () {
                    // Initial playback. Preloaded playback information
                    AudioManager.instance
                        .start(
                            songLink,
                            // "network format resource"
                            // "local resource (file://${file.path})"
                            "title",
                            desc: "desc",
                            // cover: "network cover image resource"
                            cover: "assets/ic_launcher.png")
                        .then((err) {
                      print(err);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.play_arrow,
                      size: 58.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 32.0),
              Icon(
                Icons.fast_forward,
                color: Colors.white54,
                size: 42.0,
              )
            ],
          ),
        ],
      ),
    );
  }
}
