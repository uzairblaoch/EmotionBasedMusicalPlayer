import 'package:emp/Models/searchSongs.dart';
import 'package:emp/api/response.dart';
import 'package:emp/screens/musicPlayer/model/songModel.dart';
import 'package:emp/screens/musicPlayer/widgets/customField.dart';
import 'package:flutter/material.dart';

class SongsList extends StatefulWidget {
  @override
  _SongsListState createState() => _SongsListState();
}

class _SongsListState extends State<SongsList> {
  Future<SearchSongs> searchSongs;

  @override
  void initState() {
    super.initState();
    searchSongs = Utils().fetchSongs();
  }

  var flume =
      'https://i.scdn.co/image/8d84f7b313ca9bafcefcf37d4e59a8265c7d3fff';

  var martinGarrix =
      'https://c1.staticflickr.com/2/1841/44200429922_d0cbbf22ba_b.jpg';

  var rosieLowe =
      'https://i.scdn.co/image/db8382f6c33134111a26d4bf5a482a1caa5f151c';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 70.0),
            CustomTextField(),
            SizedBox(height: 25.0),
            Text(
              'Recommend',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 32.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: FutureBuilder<SearchSongs>(
                  future: Utils().fetchSongs(),
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
                            Color.fromRGBO(216, 56, 48, 1)),
                      ),
                    );
                  }),
              /* SongItem('In the Name of Love', 'Martin Garrix', martinGarrix),
                SongItem('Never Be Like You', 'Flume', flume),
                SongItem('Worry Bout Us', 'Rosie Lowe', rosieLowe),
                SongItem('In the Name of Love', 'Martin Garrix', martinGarrix),
                SongItem('In the Name of Love', 'Martin Garrix', martinGarrix),
                SongItem('Worry Bout Us', 'Rosie Lowe', rosieLowe),
                SongItem('In the Name of Love', 'Martin Garrix', martinGarrix),
                SongItem('In the Name of Love', 'Martin Garrix', martinGarrix),*/
            )
          ],
        ),
      ),
    );
  }
}
