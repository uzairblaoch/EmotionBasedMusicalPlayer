import 'package:emp/layout/SizeConfig.dart';
import 'package:emp/screens/musicPlayer/model/music_model.dart';
import 'package:emp/screens/musicPlayer/widgets/menuWidget.dart';
import 'package:flutter/material.dart';

class MusicList extends StatefulWidget {
  MusicList({Key key}) : super(key: key);

  @override
  _MusicListState createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  List<MusicModel> _list;
  int playId = 3;
  var icon;
  @override
  void initState() {
    _list = MusicModel.list;
    playId = 3;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor:
          MediaQuery.of(context).platformBrightness == Brightness.dark
              ? Color(0XFF2e2e2e)
              : Color(0XFFd0ddf3),
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            MediaQuery.of(context).platformBrightness == Brightness.dark
                ? Color(0XFF2e2e2e)
                : Color(0XFFd0ddf3),
        centerTitle: true,
        title: Text(
          'Hello',
          style: TextStyle(
            color: MediaQuery.of(context).platformBrightness == Brightness.dark
                ? Colors.white38
                : Colors.black45,
            letterSpacing: 0.25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MenuWidget(icon: Icons.favorite),
                  Container(
                    height: SizeConfig.screenHeight * 0.25,
                    width: SizeConfig.screenHeight * 0.26,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.dark
                          ? Color(0XFF212121)
                          : Color(0XFFe5eefc),
                      boxShadow: [
                        new BoxShadow(
                          color: MediaQuery.of(context).platformBrightness ==
                                  Brightness.dark
                              ? Color(0XFF1c1c1c)
                              : Color(0XFF6f7e96), //change Color(0XFFe5eefc);
                          offset: Offset(15.0, 15.0),
                          blurRadius: 22.0,
                        ),
                        new BoxShadow(
                          color: MediaQuery.of(context).platformBrightness ==
                                  Brightness.dark
                              ? Color(0XFF404040)
                              : Colors.white38, // change Color(0XFFe5eefc);
                          offset: Offset(-15.0, -15.0),
                          blurRadius: 22.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.cover,
                              image: new AssetImage("assets/images/em.jpg")),
                        ),
                      ),
                    ),
                  ),
                  MenuWidget(icon: Icons.menu),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: _list.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'musicPlayer');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: _list[index].id == playId
                              ? MediaQuery.of(context).platformBrightness ==
                                      Brightness.dark
                                  ? Colors.black45
                                  : Color(0XFF92aeff)
                              : MediaQuery.of(context).platformBrightness ==
                                      Brightness.dark
                                  ? Color(0XFF2e2e2e)
                                  : Color(0XFFd0ddf3),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _list[index].title,
                                  style: TextStyle(
                                    color: MediaQuery.of(context)
                                                .platformBrightness ==
                                            Brightness.dark
                                        ? Colors.white38
                                        : Colors.black54,
                                    letterSpacing: 0.25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  _list[index].album,
                                  style: TextStyle(
                                    color: MediaQuery.of(context)
                                                .platformBrightness ==
                                            Brightness.dark
                                        ? Colors.white38
                                        : Colors.black38,
                                    letterSpacing: 0.25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {});
                              },
                              child: MenuWidget(
                                icon: _list[index].id == playId
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                isActive: _list[index].id == playId,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors:
                    MediaQuery.of(context).platformBrightness == Brightness.dark
                        ? [Colors.black.withAlpha(0), Colors.black54]
                        : [Color(0XFFe5eefc).withAlpha(0), Color(0XFFe5eefc)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        )
      ]),
    );
  }
}
