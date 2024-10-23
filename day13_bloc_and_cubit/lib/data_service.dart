import 'dart:convert';

import 'package:day13_bloc_and_cubit/models/post.dart';
import 'package:http/http.dart' as http;

class DataService {
  /*
  * https://jsonplaceholder.typicode.com/posts
  * */

  Future<List<Post>> posts() async {
    final uri = Uri.https('jsonplaceholder.typicode.com', '/posts');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final list = jsonDecode(response.body) as List;
      return list
          .map((post) => Post.fromJson(post as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('get list post failed');
    }
  }
}
