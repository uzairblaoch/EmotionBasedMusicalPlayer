import 'package:emp/layout/SizeConfig.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  ChangePassword({Key key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  bool _obscureText = true;
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
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                SizedBox(
                  height: SizeConfig.screenHeight * 0.15,
                ),
                Text(
                  "Change Password",
                  style: Theme.of(context).textTheme.headline1.copyWith(
                        fontSize: SizeConfig.screenWidth * 0.08,
                      ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.15,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                  height: SizeConfig.screenHeight * 0.03,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Confirm Password';
                      } else if (_password.text != _confirmPassword.text) {
                        return 'Password does not match';
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.08,
                ),
                RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      setState(() {
                        print(_password.text);
                        print(_confirmPassword.text);
                      });
                      Navigator.popUntil(
                        context,
                        ModalRoute.withName('login'),
                      );
                    }
                  },
                  elevation: 0,
                  padding: EdgeInsets.all(18),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                    "Forget Password",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.screenWidth * 0.045),
                  )),
                ),
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
