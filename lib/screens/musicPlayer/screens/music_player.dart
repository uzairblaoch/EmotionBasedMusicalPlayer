import 'package:emp/layout/SizeConfig.dart';
import 'package:emp/screens/musicPlayer/widgets/menuControls.dart';
import 'package:emp/screens/musicPlayer/widgets/menuPausePlay.dart';
import 'package:emp/screens/musicPlayer/widgets/menuWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SongScreen extends StatefulWidget {
  @override
  _SongScreenState createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  double _lowerValue = 100.0;
  double _upperValue;
  bool isPlaying = false;
  IconData faIcon = FontAwesomeIcons.play;
  double firstOffset = 5.0;
  double secondOffset = -5.0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor:
          MediaQuery.of(context).platformBrightness == Brightness.dark
              ? Color(0XFF2e2e2e)
              : Color(0XFFd0ddf3),
      body: SingleChildScrollView(
        child: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
//
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 0.06 * SizeConfig.screenHeight,
                    horizontal: 0.04 * SizeConfig.screenWidth),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: MenuWidget(icon: Icons.arrow_back),
                    ),
                    Spacer(),
                    Text(
                      "PLAYING NOW",
                      style: TextStyle(
                        color: MediaQuery.of(context).platformBrightness ==
                                Brightness.dark
                            ? Colors.white38
                            : Colors.black45,
                        letterSpacing: 0.25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    MenuWidget(icon: Icons.menu),
                  ],
                ),
              ),
              SizedBox(
                height: 0.002 * SizeConfig.screenHeight,
              ),
              Container(
                height: SizeConfig.screenHeight * 0.35,
                width: SizeConfig.screenWidth * 0.62,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: MediaQuery.of(context).platformBrightness ==
                          Brightness.dark
                      ? Color(0XFF212121)
                      : Color(0XFFe5eefc),
                  boxShadow: [
                    new BoxShadow(
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.dark
                          ? Color(0XFF1c1c1c)
                          : Color(0XFF6f7e96), //change Color(0XFFe5eefc);
                      offset: Offset(15.0, 15.0),
                      blurRadius: 22.0,
                    ),
                    new BoxShadow(
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.dark
                          ? Color(0XFF404040)
                          : Color(0XFF6f7e96), // change Color(0XFFe5eefc);
                      offset: Offset(-15.0, -15.0),
                      blurRadius: 22.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: new AssetImage("assets/images/em.jpg")),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 0.03 * SizeConfig.screenHeight,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Crack a Bottle ",
                      style: TextStyle(
                        fontSize: 7 * SizeConfig.safeBlockHorizontal,
                        color: MediaQuery.of(context).platformBrightness ==
                                Brightness.dark
                            ? Colors.white60
                            : Colors.black45,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    WidgetSpan(
                        child: Container(
                      margin: EdgeInsets.only(
                          bottom: 0.01 * SizeConfig.screenHeight),
                      child: Icon(
                        Icons.explicit,
                        color: MediaQuery.of(context).platformBrightness ==
                                Brightness.dark
                            ? Colors.white60
                            : Colors.black45,
                        size: 0.024 * SizeConfig.screenHeight,
                      ),
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 0.01 * SizeConfig.screenHeight,
              ),
              Text(
                "Eminem, Dr. Dre & 50 Cent",
                style: TextStyle(
                  fontSize: 3.0 * SizeConfig.safeBlockHorizontal,
                  color: MediaQuery.of(context).platformBrightness ==
                          Brightness.dark
                      ? Colors.white60
                      : Colors.black45,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: 0.02 * SizeConfig.screenHeight,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 0.04 * SizeConfig.screenWidth),
                child: Row(
                  children: <Widget>[
                    Text(
                      (_lowerValue / 60).toStringAsFixed(0) +
                          ":" +
                          (_lowerValue % 60).toStringAsFixed(0),
                      style: TextStyle(
                        color: MediaQuery.of(context).platformBrightness ==
                                Brightness.dark
                            ? Colors.white60
                            : Colors.black45,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "4:57",
                      style: TextStyle(
                        color: MediaQuery.of(context).platformBrightness ==
                                Brightness.dark
                            ? Colors.white60
                            : Colors.black45,
                      ),
                    ),
                  ],
                ),
              ),
              FlutterSlider(
                values: [_lowerValue, _upperValue],
                max: 297,
                min: 0,
                tooltip: FlutterSliderTooltip(
                    textStyle:
                        TextStyle(fontSize: 13, color: Colors.transparent),
                    boxStyle: FlutterSliderTooltipBox(
                        decoration: BoxDecoration(color: Colors.transparent))),
                trackBar: FlutterSliderTrackBar(
                  inactiveTrackBar: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black12,
                    border: Border.all(width: 10, color: Colors.black87),
                    boxShadow: [
                      new BoxShadow(
                        color: MediaQuery.of(context).platformBrightness ==
                                Brightness.dark
                            ? Color(0XFF171717)
                            : Color(0XFFe5eefc), // change Color(0XFFe5eefc)
                        offset: Offset(-3.0, -3.0),
                        blurRadius: 3.0,
                      ),
                      new BoxShadow(
                        color: MediaQuery.of(context).platformBrightness ==
                                Brightness.dark
                            ? Color(0XFF404040)
                            : Color(0XFFe5eefc),
                        offset: Offset(1.0, 1.0),
                        blurRadius: 0.5,
                      ),
                    ],
                  ),
                  activeTrackBar: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      new BoxShadow(
                        color: MediaQuery.of(context).platformBrightness ==
                                Brightness.dark
                            ? Color(0XFF171717)
                            : Color(0XFFe5eefc), // change Color(0XFFe5eefc)
                        offset: Offset(-3.0, -3.0),
                        blurRadius: 3.0,
                      ),
                      new BoxShadow(
                        color: MediaQuery.of(context).platformBrightness ==
                                Brightness.dark
                            ? Color(0XFF404040)
                            : Color(0XFFe5eefc), // change Color(0XFFe5eefc)
                        offset: Offset(1.0, 1.0),
                        blurRadius: 3.0,
                      ),
                    ],
                    gradient: MediaQuery.of(context).platformBrightness ==
                            Brightness.dark
                        ? LinearGradient(colors: [Colors.red, Colors.amber])
                        : LinearGradient(
                            colors: [Color(0XFF5880ff), Color(0XFF92aeff)]),
                  ),
                ),
                handler: FlutterSliderHandler(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFF1c1c1c),
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      padding: EdgeInsets.all(11),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: MediaQuery.of(context).platformBrightness ==
                                Brightness.dark
                            ? Colors.black54
                            : Color(0XFFd0ddf3),
                        boxShadow: [
                          new BoxShadow(
                            color: MediaQuery.of(context).platformBrightness ==
                                    Brightness.dark
                                ? Color(0XFF404040)
                                : Color(0XFF6f7e96),
                            offset: Offset(3.0, 3.0),
                            blurRadius: 5.0,
                          ),
                          new BoxShadow(
                            color: MediaQuery.of(context).platformBrightness ==
                                    Brightness.dark
                                ? Color(0XFF404040)
                                : Color(0XFFe5eefc),
                            offset: Offset(-3.0, -3.0),
                            blurRadius: 5.0,
                          ),
                        ],
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: MediaQuery.of(context).platformBrightness ==
                                  Brightness.dark
                              ? Colors.amber
                              : Color(0XFF5880ff),
                          shape: BoxShape.circle,
                          boxShadow: [
                            new BoxShadow(
                              color:
                                  MediaQuery.of(context).platformBrightness ==
                                          Brightness.dark
                                      ? Color(0XFF404040)
                                      : Colors.white,
                              offset: Offset(5.0, 5.0),
                              blurRadius: 10.0,
                            ),
                            new BoxShadow(
                              color:
                                  MediaQuery.of(context).platformBrightness ==
                                          Brightness.dark
                                      ? Color(0XFF404040)
                                      : Colors.white,
                              offset: Offset(-5.0, -5.0),
                              blurRadius: 10.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                onDragging: (handlerIndex, lowerValue, upperValue) {
                  setState(() {
                    _lowerValue = lowerValue;
                    _upperValue = upperValue;
                  });
                },
              ),
              SizedBox(
                height: 0.01 * SizeConfig.screenHeight,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 0.1 * SizeConfig.screenWidth),
                child: Row(
                  children: <Widget>[
                    menuControll(icon: FontAwesomeIcons.backward),
                    Spacer(),
                    GestureDetector(
                        onTap: () {
                          if (isPlaying == true) {
                            setState(() {
                              faIcon = FontAwesomeIcons.play;
                              isPlaying = !isPlaying;
                              firstOffset = -5.0;
                              secondOffset = -5.0;
                            });
                          } else if (isPlaying == false) {
                            setState(() {
                              faIcon = FontAwesomeIcons.pause;
                              isPlaying = !isPlaying;
                              firstOffset = 5.0;
                              secondOffset = 5.0;
                            });
                          }
                        },
                        child: menuPausePlay(
                            icon: faIcon,
                            firstOffset: firstOffset,
                            secondOffset: secondOffset)),
                    Spacer(),
                    menuControll(icon: FontAwesomeIcons.forward),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
