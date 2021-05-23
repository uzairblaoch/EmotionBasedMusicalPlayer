import 'package:emp/layout/SizeConfig.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  ForgetPassword({Key key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
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
                  "Forget Password ?",
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
                  height: SizeConfig.screenHeight * 0.08,
                ),
                RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      setState(() {
                        print(_email.text);
                      });
                      Navigator.pushNamed(context, 'opt');
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
}
