import 'package:emp/Models/searchSongs.dart';
import 'package:emp/api/response.dart';
import 'package:emp/layout/SizeConfig.dart';
import 'package:emp/screens/musicPlayer/model/songModel.dart';
import 'package:emp/screens/musicPlayer/widgets/customField.dart';
import 'package:flutter/material.dart';

class SongsList extends StatefulWidget {
  @override
  _SongsListState createState() => _SongsListState();
}

class _SongsListState extends State<SongsList> {
  Future<SearchSongs> searchSongs;
  var mood;
  @override
  void initState() {
    super.initState();
    //searchSongs = Utils().fetchSongs();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final arguments = ModalRoute.of(context).settings.arguments as Map;
    if (arguments != null) {
      mood = arguments['mood'];
    } else {
      mood = "sad";
    }
    // print(arguments['mood']);
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            MediaQuery.of(context).platformBrightness == Brightness.dark
                ? Colors.black12
                : Colors.white,
        leading: BackButton(
            color: MediaQuery.of(context).platformBrightness == Brightness.dark
                ? Colors.white
                : Colors.black),
        title: Text(
          "Songs",
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                fontSize: SizeConfig.screenWidth * 0.044,
              ),
        ),
        // centerTitle: true,
      ),
      backgroundColor: Colors.black38,
      body: Container(
        decoration: BoxDecoration(
            color: MediaQuery.of(context).platformBrightness == Brightness.dark
                ? Colors.black12
                : Colors.white), //////////
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              CustomTextField(),
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              Text(
                'Recommend',
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontSize: SizeConfig.screenWidth * 0.065,
                    ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.02,
              ),
              Expanded(
                child: FutureBuilder<SearchSongs>(
                    future: Utils().fetchSongs(mood),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data?.data?.length,
                            itemBuilder: (BuildContext context, index) {
                              return SongItem(
                                  snapshot.data.data[index].titleShort,
                                  snapshot.data.data[index].artist.name,
                                  snapshot.data.data[index].artist.pictureBig,
                                  snapshot.data.data[index].preview);
                            });
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor: new AlwaysStoppedAnimation<Color>(
                              MediaQuery.of(context).platformBrightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
