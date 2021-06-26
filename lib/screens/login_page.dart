import 'dart:async';

import 'package:emp/api/response.dart';
import 'package:emp/layout/SizeConfig.dart';
import 'package:emp/screens/forget_password.dart';
import 'package:emp/screens/signup_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Timer _timer;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Form(
      key: _formKey,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: SizeConfig.screenHeight * 0.14,
                bottom: SizeConfig.screenHeight * 0.06),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hello, \nWelcome Back",
                    style: Theme.of(context).textTheme.headline1.copyWith(
                          fontSize: SizeConfig.screenWidth * 0.1,
                        )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          color: Theme.of(context).dividerColor,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: TextFormField(
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Email"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Email';
                          } else {
                            var email = value;
                            bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(email);
                            if (!emailValid) {
                              return 'Please Enter Valid Email';
                            }
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          color: Theme.of(context).dividerColor,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: TextFormField(
                        controller: _password,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                          suffixIcon: InkWell(
                            onTap: _togglePasswordView,
                            child: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).dividerColor,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Password';
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, 'forgotPassword'),
                      child: Text(
                        "Forgot Password?",
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontSize: SizeConfig.screenWidth * 0.034,
                            ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    RaisedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            print(_email.text);
                            print(_password.text);
                          });
                          _timer?.cancel();
                          await EasyLoading.show(
                            status: 'loading...',
                            maskType: EasyLoadingMaskType.black,
                          );
                          var response = await Utils().login(
                            _email.text,
                            _password.text,
                          );
                          print(response);
                          if (response['message'] ==
                              "The selected email is invalid.") {
                            _timer?.cancel();
                            await EasyLoading.showError(response['message']);
                          } else if (response['message'] ==
                              "Invalid Password") {
                            _timer?.cancel();
                            await EasyLoading.showError(response['message']);
                          } else {
                            _timer?.cancel();
                            await EasyLoading.showSuccess(response['message']);
                            Navigator.pushNamed(context, 'mainScreen');
                          }
                        }
                      },
                      elevation: 0,
                      padding: EdgeInsets.all(18),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                          child: Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.screenWidth * 0.045),
                      )),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontSize: SizeConfig.screenWidth * 0.034,
                            ),
                        children: [
                          TextSpan(text: 'Do not have an account yet? '),
                          TextSpan(
                            text: 'SIGN UP',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: new TapGestureRecognizer()
                              ..onTap =
                                  () => Navigator.pushNamed(context, 'signup'),
                          )
                        ],
                      ),
                    ),
                    /*Text("Create account",
                      style: Theme.of(context).textTheme.bodyText1)*/
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
