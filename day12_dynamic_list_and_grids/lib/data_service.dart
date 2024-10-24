import 'dart:convert';

import 'package:day12_dynamic_list_and_grids/models.dart';
import 'package:http/http.dart' as http;

class DataService {
/*
*https://api.themoviedb.org/3/movie/now_playing?language=vi&page=1
 */

  Future<Data> getNowPlaying() async {
    final uri =
        Uri.https('api.themoviedb.org', '/3/movie/now_playing', _queryParams);
    final response = await http.get(uri, headers: headers);
    return Data.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }

  final Map<String, String> headers = {
    'Accept': 'application/json',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2ODQ2OWQ1MGZkOGEzZmJjMmRjZmY5MzM2MDcyMGM4NCIsIm5iZiI6MTcyOTUwMDEzMi4zNzMxOTcsInN1YiI6IjYwYmVkZjBjOTYwY2RlMDAyOTgzNWVkMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.WS39o1oE-oPvBjXfPv6W448qwxp_67Gqtae8B3N1VFY',
  };

  final _queryParams = {
    'language': 'vi',
    'page': '1',
  };
}
