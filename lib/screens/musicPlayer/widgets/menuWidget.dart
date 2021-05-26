import 'package:emp/layout/SizeConfig.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  IconData icon;
  bool isActive;
  MenuWidget({@required this.icon, this.isActive = false});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var boxDecoration = BoxDecoration(
      shape: BoxShape.circle,
      gradient: MediaQuery.of(context).platformBrightness == Brightness.dark
          ? LinearGradient(
              begin: Alignment.topLeft,
              colors: [Color(0XFF303030), Color(0XFF1a1a1a)])
          : LinearGradient(
              begin: Alignment.topLeft,
              colors: [Color(0XFFd0ddf3), Color(0XFFd0ddf3)]),
    );
    if (isActive) {
      boxDecoration = boxDecoration.copyWith(
        gradient: MediaQuery.of(context).platformBrightness == Brightness.dark
            ? LinearGradient(
                begin: Alignment.topLeft,
                colors: [Colors.red[700], Colors.orange[700]])
            : LinearGradient(
                begin: Alignment.topLeft,
                colors: [Color(0XFF5880ff), Color(0XFF5880ff)]),
      );
    } else {
      boxDecoration = boxDecoration.copyWith(
        gradient: MediaQuery.of(context).platformBrightness == Brightness.dark
            ? LinearGradient(
                begin: Alignment.topLeft,
                colors: [Color(0XFF303030), Color(0XFF1a1a1a)])
            : LinearGradient(
                begin: Alignment.topLeft,
                colors: [Color(0XFFd0ddf3), Color(0XFFd0ddf3)]),
      );
    }

    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0XFF2e2e2e),
          gradient: MediaQuery.of(context).platformBrightness == Brightness.dark
              ? LinearGradient(
                  begin: Alignment.topLeft,
                  colors: [Color(0XFF1c1c1c), Color(0XFF383838)],
                )
              : LinearGradient(
                  begin: Alignment.topLeft,
                  colors: [Color(0XFFe5eefc), Color(0XFFe5eefc)],
                ),
          boxShadow: [
            new BoxShadow(
              color:
                  MediaQuery.of(context).platformBrightness == Brightness.dark
                      ? Color(0XFF4a4a4a)
                      : Color(0XFF6f7e96),
              offset: Offset(5.0, 5.0),
//                          spreadRadius: -5.0,
              blurRadius: 10.0,
            ),
            new BoxShadow(
              color:
                  MediaQuery.of(context).platformBrightness == Brightness.dark
                      ? Color(0XFF4a4a4a)
                      : Color(0XFFe5eefc),
              offset: Offset(-5.0, -5.0),
//                          spreadRadius: -5.0,
              blurRadius: 10.0,
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(1.5),
        child: Container(
          decoration: boxDecoration,
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Icon(
              icon,
              size: 0.07 * SizeConfig.screenWidth,
              color: isActive
                  ? MediaQuery.of(context).platformBrightness == Brightness.dark
                      ? Colors.white38
                      : Colors.white
                  : MediaQuery.of(context).platformBrightness == Brightness.dark
                      ? Colors.white38
                      : Colors.black45,
            ),
          ),
        ),
      ),
    );
  }
}
