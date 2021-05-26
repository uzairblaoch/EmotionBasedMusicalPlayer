import 'package:emp/layout/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class menuPausePlay extends StatelessWidget {
  IconData icon;
  double firstOffset, secondOffset;
  menuPausePlay(
      {@required this.icon,
      @required this.firstOffset,
      @required this.secondOffset});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0XFF2e2e2e),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [Color(0XFF1c1c1c), Color(0XFF383838)],
          ),
          boxShadow: [
            new BoxShadow(
              color:
                  MediaQuery.of(context).platformBrightness == Brightness.dark
                      ? Color(0XFF4a4a4a)
                      : Color(0XFFe5eefc),
              offset: Offset(firstOffset, firstOffset),
              blurRadius: 6.0,
            ),
            new BoxShadow(
              color:
                  MediaQuery.of(context).platformBrightness == Brightness.dark
                      ? Color(0XFF4a4a4a)
                      : Color(0XFF6f7e96),
              offset: Offset(secondOffset, secondOffset),
              blurRadius: 6.0,
            ),
          ]),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: MediaQuery.of(context).platformBrightness == Brightness.dark
                ? Colors.red[700]
                : Color(0XFF5880ff),
            width: 1.0,
          ),
          shape: BoxShape.circle,
          gradient: MediaQuery.of(context).platformBrightness == Brightness.dark
              ? LinearGradient(
                  begin: Alignment.topLeft,
                  colors: [Colors.red[700], Colors.deepOrange[700]])
              : LinearGradient(
                  begin: Alignment.topLeft,
                  colors: [Color(0XFF5880ff), Color(0XFF5880ff)]),
        ),
        child: Padding(
          padding: EdgeInsets.all(0.1 * SizeConfig.screenWidth),
          child: FaIcon(
            icon,
            color: Colors.white70,
            size: 0.04 * SizeConfig.screenWidth,
          ),
        ),
      ),
    );
  }
}
