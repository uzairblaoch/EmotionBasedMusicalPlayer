import 'dart:async';

import 'package:emp/api/response.dart';
import 'package:emp/layout/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Timer _timer;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  final first_name = TextEditingController();
  final last_name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
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
                top: SizeConfig.screenHeight * 0.07,
                bottom: SizeConfig.screenHeight * 0.06),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Align(
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back_ios),
                        Text('Back',
                            style:
                                Theme.of(context).textTheme.headline1.copyWith(
                                      fontSize: SizeConfig.screenWidth * 0.05,
                                    ))
                      ],
                    ),
                    alignment: Alignment.topLeft,
                  ),
                ),
                Text("Sign Up",
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
                        controller: first_name,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "First Name"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter First Name';
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
                        controller: last_name,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Last Name"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Last Name';
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
                          } else {
                            var pass = value;
                            String pattern =
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                            bool passValid = RegExp(pattern).hasMatch(pass);
                            if (!passValid) {
                              return 'Mininum 8 @ Upper,Lower & Special Charaters';
                            }
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          color: Theme.of(context).dividerColor,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: TextFormField(
                        controller: _confirmPassword,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Confirm Password",
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
                        // ignore: missing_return
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Confirm Password';
                          } else {
                            var pass = value;
                            String pattern =
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                            bool passValid = RegExp(pattern).hasMatch(pass);
                            if (!passValid) {
                              return 'Mininum 8 @ Upper,Lower & Special Charaters';
                            } else if (_password.text !=
                                _confirmPassword.text) {
                              return 'Password does not match';
                            }
                          }
                        },
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
                            print(first_name.text);
                            print(last_name.text);
                            print(_email.text);
                            print(_password.text);
                            print(_confirmPassword.text);
                          });
                          _timer?.cancel();
                          await EasyLoading.show(
                            status: 'loading...',
                            maskType: EasyLoadingMaskType.black,
                          );
                          var response = await Utils().register(
                              first_name.text,
                              last_name.text,
                              _email.text,
                              _password.text,
                              _confirmPassword.text);
                          if (response['message'] ==
                              "The email has already been taken.") {
                            _timer?.cancel();
                            await EasyLoading.showError(response['message']);
                          } else {
                            _timer?.cancel();
                            await EasyLoading.showSuccess(response['message']);
                            Navigator.pop(context);
                          }
                        }
                      },
                      elevation: 0,
                      padding: EdgeInsets.all(18),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.screenWidth * 0.045),
                        ),
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
