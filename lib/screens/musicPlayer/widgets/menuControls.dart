import 'package:emp/layout/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class menuControll extends StatelessWidget {
  IconData icon;
  menuControll({@required this.icon});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
        padding: const EdgeInsets.all(3.0),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient:
                MediaQuery.of(context).platformBrightness == Brightness.dark
                    ? LinearGradient(
                        begin: Alignment.topLeft,
                        colors: [Color(0XFF303030), Color(0XFF1a1a1a)])
                    : LinearGradient(
                        begin: Alignment.topLeft,
                        colors: [Color(0XFFd0ddf3), Color(0XFFd0ddf3)]),
          ),
          child: Padding(
            padding: EdgeInsets.all(0.063 * SizeConfig.screenWidth),
            child: FaIcon(
              icon,
              color:
                  MediaQuery.of(context).platformBrightness == Brightness.dark
                      ? Colors.white54
                      : Colors.black45,
              size: 0.05 * SizeConfig.screenWidth,
            ),
          ),
        ),
      ),
    );
  }
}
