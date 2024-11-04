import 'dart:convert';

import 'package:day15_bloc_navigator/data/model/post.dart';
import 'package:http/http.dart' as http;

class DataService {
  /*
  * https://jsonplaceholder.typicode.com/posts
  */
  Future<List<Post>> posts() async {
    final uri = Uri.https('jsonplaceholder.typicode.com', '/posts');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      return json.map((e) => Post.fromJson(e as Map<String, dynamic>)).toList();
    } else {
      throw Exception('load data failed HEHE');
    }
  }
}
