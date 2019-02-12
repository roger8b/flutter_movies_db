import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = '516b7549a6f5977f75014cf96c413c47';

  Future<ItemModel> fetchMovieList() async {
    print('entered');
    final response = await client.get(
      'https://api.themoviedb.org/3/movie/popular'
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
}