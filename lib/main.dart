import 'package:emp/screens/change_password.dart';
import 'package:emp/screens/forget_password.dart';
import 'package:emp/screens/home.dart';
import 'package:emp/screens/login_page.dart';
import 'package:emp/screens/otp.dart';
import 'package:emp/screens/signup_page.dart';
import 'package:emp/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: AppTheme.light,
    darkTheme: AppTheme.dark,
    themeMode: ThemeMode.system,
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login': (context) => LoginPage(),
      'signup': (context) => SignUpPage(),
      'forgotPassword': (context) => ForgetPassword(),
      'opt': (context) => Opt(),
      'changePassword': (context) => ChangePassword(),
      'home': (context) => Home(),
    },
  ));
}
