import 'dart:convert';

import 'package:day10_networking_requests_copy/model/new.dart';
import 'package:http/http.dart' as http;

class DataService {
  /*
  * https://api.first.org/data/v1/news
  */

  Future<List<New>> makeRequest() async {
    final uri = Uri.https('api.first.org', '/data/v1/news');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body)['data'] as List;
      return responseBody
          .map((value) => New.fromJson(value as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to get news');
    }
  }
}
