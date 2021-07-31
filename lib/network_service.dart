
import 'package:http/http.dart';


import 'dart:convert';
 import 'package:movies_info_app/model/movie.dart';

Future<List<Movie>> fetchAllMovies() async {
    Uri url = Uri.parse("https://www.omdbapi.com/?s=Batman&page=2&apikey=a5feaf44");
    Response response = await get(url);
    if (response.statusCode==200){
      final j = json.decode(response.body);
      List result = j["Search"];
      return result.map((e) => Movie.fromJson(e)).toList();
    }
    else
      throw Exception("Failed to load movies");
 }

