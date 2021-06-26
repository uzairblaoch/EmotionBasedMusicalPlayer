import 'package:emp/layout/SizeConfig.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox.expand(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: SizeConfig.screenHeight * 0.12,
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.15,
            width: SizeConfig.screenHeight * 0.15,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://www.dentistry.co.uk/wp-content/uploads/2020/11/anonymous-avatar-icon-25.png"),
                ),
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.02,
          ),
          Text(
            "@Username",
            style: Theme.of(context).textTheme.headline1.copyWith(
                  fontSize: SizeConfig.screenWidth * 0.06,
                ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.04,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: FlatButton(
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: Theme.of(context).dividerColor,
              onPressed: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    color: MediaQuery.of(context).platformBrightness ==
                            Brightness.dark
                        ? Colors.white54
                        : Colors.black45,
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      'My Account',
                      style: Theme.of(context).textTheme.headline1.copyWith(
                            fontSize: SizeConfig.screenWidth * 0.035,
                          ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: MediaQuery.of(context).platformBrightness ==
                            Brightness.dark
                        ? Colors.white54
                        : Colors.black45,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.01,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: FlatButton(
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: Theme.of(context).dividerColor,
              onPressed: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.help,
                    color: MediaQuery.of(context).platformBrightness ==
                            Brightness.dark
                        ? Colors.white54
                        : Colors.black45,
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      'Help Center',
                      style: Theme.of(context).textTheme.headline1.copyWith(
                            fontSize: SizeConfig.screenWidth * 0.035,
                          ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: MediaQuery.of(context).platformBrightness ==
                            Brightness.dark
                        ? Colors.white54
                        : Colors.black45,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.01,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: FlatButton(
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: Theme.of(context).dividerColor,
              onPressed: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.logout,
                    color: MediaQuery.of(context).platformBrightness ==
                            Brightness.dark
                        ? Colors.white54
                        : Colors.black45,
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      'Log Out',
                      style: Theme.of(context).textTheme.headline1.copyWith(
                            fontSize: SizeConfig.screenWidth * 0.035,
                          ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: MediaQuery.of(context).platformBrightness ==
                            Brightness.dark
                        ? Colors.white54
                        : Colors.black45,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
