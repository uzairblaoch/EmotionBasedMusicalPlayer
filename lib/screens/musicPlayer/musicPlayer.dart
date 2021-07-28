import 'package:audioplayers/audioplayers.dart';
import 'package:emp/layout/SizeConfig.dart';
import 'package:flutter/material.dart';

class musicPlayer extends StatefulWidget {
  final title;
  final artist;
  final image;
  final songLink;
  final AudioPlayer audioPlayer;
  musicPlayer(
      this.audioPlayer, this.title, this.artist, this.image, this.songLink);

  @override
  _musicPlayerState createState() => _musicPlayerState();
}

class _musicPlayerState extends State<musicPlayer> {
  Duration _duration = Duration();
  Duration _position = Duration();
  bool isPlaying = false;
  bool isPaused = false;

  @override
  void initState() {
    super.initState();
    this.widget.audioPlayer.onDurationChanged.listen((d) {
      if (mounted) {
        setState(() {
          _duration = d;
        });
      }
    });
    this.widget.audioPlayer.onAudioPositionChanged.listen((p) {
      if (mounted) {
        setState(() {
          _position = p;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor:
          MediaQuery.of(context).platformBrightness == Brightness.dark
              ? Colors.black
              : Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            height: SizeConfig.screenHeight * 0.68,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.image),
                          fit: BoxFit.cover)),
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
                      SizedBox(height: SizeConfig.screenHeight * 0.04),
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
                      Text(widget.title,
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontWeight: FontWeight.bold,
                              fontSize: 32.0)),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        widget.artist,
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
          SizedBox(height: 15.0),
          slider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  _position.toString().split(".")[0],
                  style: Theme.of(context).textTheme.caption.copyWith(
                        fontSize: SizeConfig.screenWidth * 0.034,
                      ),
                ),
                Text(
                  _duration.toString().split(".")[0],
                  style: Theme.of(context).textTheme.caption.copyWith(
                        fontSize: SizeConfig.screenWidth * 0.034,
                      ),
                )
              ],
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.025),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.fast_rewind,
                color:
                    MediaQuery.of(context).platformBrightness == Brightness.dark
                        ? Colors.white
                        : Colors.black38,
                size: SizeConfig.screenWidth * 0.1,
              ),
              SizedBox(width: SizeConfig.screenWidth * 0.1),
              Container(
                decoration: BoxDecoration(
                    color: MediaQuery.of(context).platformBrightness ==
                            Brightness.dark
                        ? Colors.white
                        : Colors.black,
                    borderRadius: BorderRadius.circular(50.0)),
                child: InkWell(
                  onTap: () async {
                    if (isPlaying == false) {
                      this.widget.audioPlayer.play(widget.songLink);
                      setState(() {
                        isPlaying = true;
                      });
                    } else if (isPlaying == true) {
                      this.widget.audioPlayer.pause();
                      setState(() {
                        isPlaying = false;
                      });
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      size: SizeConfig.screenWidth * 0.15,
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.dark
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(width: SizeConfig.screenWidth * 0.1),
              Icon(
                Icons.fast_forward,
                color:
                    MediaQuery.of(context).platformBrightness == Brightness.dark
                        ? Colors.white
                        : Colors.black38,
                size: SizeConfig.screenWidth * 0.1,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget slider() {
    return Slider(
      activeColor: MediaQuery.of(context).platformBrightness == Brightness.dark
          ? Colors.white
          : Colors.black,
      inactiveColor:
          MediaQuery.of(context).platformBrightness == Brightness.dark
              ? Colors.white24
              : Colors.black12,
      value: _position.inSeconds.toDouble(),
      min: 0.0,
      max: _duration.inSeconds.toDouble(),
      onChanged: (double value) {
        setState(() {
          changeToSecond(value.toInt());
          value = value;
        });
      },
    );
  }

  void changeToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    this.widget.audioPlayer.seek(newDuration);
  }
}
