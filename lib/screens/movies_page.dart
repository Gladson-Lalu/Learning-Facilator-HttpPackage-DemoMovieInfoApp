import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_info_app/constants.dart';
import 'package:movies_info_app/model/movie.dart';
import 'package:movies_info_app/network_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<Movie> _moviesList = moviesList;
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Movies",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.red,
          actions: [
            IconButton(
                icon: Icon(
                  Icons.search,
                  size: 26,
                ),
                onPressed: () {})
          ],
        ),

        /*
        //Build Body using when hardcoded details in constant.dart
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _moviesList.length,
                itemBuilder: (context, index) {
                  Movie _currentMovie = _moviesList[index];
                  return CustomListTile(dataMovie: _currentMovie);
                })));
                */
        body: homeBuilder());
  }
}

//Custom ListTile
Widget CustomListTile({required Movie dataMovie}) {
  return Container(
      padding: EdgeInsets.only(left: 13, top: 13, bottom: 13),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.only(top: 12),
      child: Flex(
          direction: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 5,
              child: ClipRRect(
                //child: Image.asset(  Use this when your are using hardcoded details
                child: Image.network(
                  dataMovie.imageUrl,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      dataMovie.name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  )),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Text(
                    dataMovie.score,
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Icon(
                    CupertinoIcons.star_fill,
                    color: Colors.amberAccent[400],
                    size: 18,
                  ),
                ],
              ),
            ),
          ]));
}

Widget homeBuilder() {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: FutureBuilder(
        future: fetchAllMovies(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            List<Movie> _moviesList = snapshot.data;
            return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _moviesList.length,
                itemBuilder: (context, index) {
                  Movie _currentMovie = _moviesList[index];
                  return CustomListTile(dataMovie: _currentMovie);
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ));
}
