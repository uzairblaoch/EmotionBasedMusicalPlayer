import 'package:emp/layout/SizeConfig.dart';
import 'package:emp/screens/change_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class Opt extends StatefulWidget {
  Opt({Key key}) : super(key: key);

  @override
  _OptState createState() => _OptState();
}

class _OptState extends State<Opt> {
  TextEditingController controller = TextEditingController();
  String thisText = "";
  int pinLength = 4;
  bool hasError = false;
  String errorMessage;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
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
                          style: Theme.of(context).textTheme.headline1.copyWith(
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
                "Verify Opt",
                style: Theme.of(context).textTheme.headline1.copyWith(
                      fontSize: SizeConfig.screenWidth * 0.08,
                    ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.15,
              ),
              Center(
                child: Container(
                  height: 100.0,
                  child: PinCodeTextField(
                    autofocus: true,
                    controller: controller,
                    hideCharacter: false,
                    highlight: true,
                    errorBorderColor: Colors.red,
                    highlightColor: Theme.of(context).dividerColor,
                    defaultBorderColor: Theme.of(context).primaryColorLight,
                    hasTextBorderColor: Theme.of(context).primaryColorLight,
                    //highlightPinBoxColor: Colors.orange,
                    maxLength: pinLength,
                    hasError: hasError,

                    onTextChanged: (text) {},
                    onDone: (text) {
                      if (text != '2552') {
                        setState(() {
                          thisText = 'Opps! Wrong Pin';
                        });
                      } else {
                        setState(() {
                          thisText = '';
                        });
                        Navigator.pushNamed(context, 'changePassword');
                      }
                      print("DONE $text");
                      print("DONE CONTROLLER ${controller.text}");
                    },

                    pinBoxWidth: SizeConfig.screenWidth * 0.18,
                    pinBoxHeight: SizeConfig.screenHeight * 0.1,
                    hasUnderline: false,
                    wrapAlignment: WrapAlignment.spaceAround,
                    pinBoxDecoration:
                        ProvidedPinBoxDecoration.roundedPinBoxDecoration,
                    pinTextStyle:
                        Theme.of(context).textTheme.headline1.copyWith(
                              fontSize: SizeConfig.screenWidth * 0.05,
                            ),
                    pinTextAnimatedSwitcherTransition:
                        ProvidedPinBoxTextAnimation.scalingTransition,
                    pinBoxColor: Theme.of(context).dividerColor,
                    pinTextAnimatedSwitcherDuration:
                        Duration(milliseconds: 300),
//                    highlightAnimation: true,
                    //   highlightAnimationBeginColor: Colors.black,
                    // highlightAnimationEndColor: Colors.black,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              Center(
                child: Text(
                  thisText,
                  style: Theme.of(context).textTheme.headline1.copyWith(
                      fontSize: SizeConfig.screenWidth * 0.051,
                      color: Colors.red),
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.04,
              ),
              /* RaisedButton(
                onPressed: () {
                  setState(() {
                    var validate = controller.text;
                    if (validate.length != 4) {
                      thisText = 'Please enter Opt';
                    }
                  });
                },
                elevation: 0,
                padding: EdgeInsets.all(18),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                    child: Text(
                  "Verify",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.screenWidth * 0.045),
                )),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
