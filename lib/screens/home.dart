import 'package:emp/api/response.dart';
import 'package:emp/layout/SizeConfig.dart';
import 'package:emp/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:tflite/tflite.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var mood;
  File _imageFile;
  List _identifiedResult;
  @override
  void initState() {
    super.initState();
    loadEmojiModel();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future selectImage() async {
    final picker = ImagePicker();
    var image =
        await picker.getImage(source: ImageSource.camera, maxHeight: 300);
    identifyImage(image);
  }

  Future loadEmojiModel() async {
    Tflite.close();
    String result;
    result = await Tflite.loadModel(
      model: "assets/model/simple_classifier.tflite",
      labels: "assets/model/emoji_labels.txt",
    );
    print("-------------------------------------------------------------");
    print(result);
    print("-------------------------------------------------------------");
  }

  Future identifyImage(image) async {
    _identifiedResult = null;
    // Run tensorflowlite image classification model on the image
    print("classification start $image");
    final List result = await Tflite.runModelOnImage(
        path: image.path,
        imageMean: 0.0,
        imageStd: 255.0,
        numResults: 2,
        threshold: 0.2,
        asynch: true);
    print("classification done");
    setState(() {
      if (image != null) {
        _imageFile = File(image.path);
        _identifiedResult = result;
        print("------------------------------------------");
        print(_identifiedResult);
        print("------------------------------------------");
      } else {
        print('No image selected.');
      }
    });
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
              top: SizeConfig.screenHeight * 0.08,
              bottom: SizeConfig.screenHeight * 0.06),
          child: Column(
            children: [
              Text(
                "Detect Mood",
                style: Theme.of(context).textTheme.headline1.copyWith(
                      fontSize: SizeConfig.screenWidth * 0.1,
                    ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).dividerColor,
                      offset: Offset(2, 2),
                      spreadRadius: 2,
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: (_imageFile != null)
                    ? Image.file(_imageFile)
                    : Image.network('https://i.imgur.com/sUFH1Aq.png'),
              ),
              ElevatedButton(
                onPressed: () {
                  selectImage();
                },
                child: Icon(
                  Icons.add_a_photo,
                  size: 25,
                ),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).dividerColor,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(24),
                ),
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                child: Column(
                    children: _identifiedResult != null
                        ? [
                            Text(
                              "Result : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: SizeConfig.screenWidth * 0.045),
                            ),
                            Card(
                              elevation: 1.0,
                              child: Container(
                                width: 100,
                                margin: EdgeInsets.all(10),
                                child: Center(
                                  child: Text(
                                    "${_identifiedResult[0]["label"]}",
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ),
                            )
                          ]
                        : []),
              ),
              /*TextButton(
                onPressed: () async {
                  Navigator.pushNamed(context, 'musicList');
                  // var response = await Utils().fetchSongs();
                  //print(response);
                },
                child: const Text(
                  'Recommended Songs',
                  style: TextStyle(
                      color: Colors.white, backgroundColor: Colors.red),
                ),
              ),*/
              SingleChildScrollView(
                child: Column(
                  children: _identifiedResult != null
                      ? [
                          InkWell(
                            onTap: () {
                              //${_identifiedResult[0]["label"]}
                              Navigator.pushNamed(context, 'musicList',
                                  arguments: {
                                    'mood': "${_identifiedResult[0]["label"]}"
                                  });
                            },
                            child: Card(
                              elevation: 1.0,
                              child: Container(
                                width: 200,
                                margin: EdgeInsets.all(10),
                                child: Center(
                                  child: Text(
                                    "Recommended Songs",
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]
                      : [],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
