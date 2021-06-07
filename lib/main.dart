import 'dart:io';

import 'package:emp/screens/change_password.dart';
import 'package:emp/screens/forget_password.dart';
import 'package:emp/screens/home.dart';
import 'package:emp/screens/login_page.dart';
import 'package:emp/screens/musicPlayer/screens/music_list.dart';
import 'package:emp/screens/musicPlayer/screens/music_player.dart';
import 'package:emp/screens/otp.dart';
import 'package:emp/screens/signup_page.dart';
import 'package:emp/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
   HttpOverrides.global = new MyHttpOverrides();
  runApp(MaterialApp(
    theme: AppTheme.light,
    darkTheme: AppTheme.dark,
    themeMode: ThemeMode.system,
    debugShowCheckedModeBanner: false,
    builder: EasyLoading.init(),
    initialRoute: 'login',
    routes: {
      'login': (context) => LoginPage(),
      'signup': (context) => SignUpPage(),
      'forgotPassword': (context) => ForgetPassword(),
      'opt': (context) => Opt(),
      'changePassword': (context) => ChangePassword(),
      'home': (context) => Home(),
      'musicList': (context) => MusicList(),
      'musicPlayer': (context) => SongScreen(),
    },
  ));
}
void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
    
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
