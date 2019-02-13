import 'dart:async';
import 'package:flutter_movies_db/src/models/trailer_model.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = '516b7549a6f5977f75014cf96c413c47';
  final _baseUrl = "http://api.themoviedb.org/3/movie";

  Future<ItemModel> fetchMovieList() async {
    print('entered');
    final response = await client.get(
      '$_baseUrl/popular'
          '?api_key=$_apiKey'
          '&language=pt-BR'
          '&page=1');
    print(response.body.toString());
    if(response.statusCode == 200){
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falid to load post');
    }
  }

  Future<TrailerModel> fetchTrailer(int movieId) async {
    final response =
    await client.get("$_baseUrl/$movieId/videos?api_key=$_apiKey");

    if (response.statusCode == 200) {
      return TrailerModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load trailers');
    }
  }
}