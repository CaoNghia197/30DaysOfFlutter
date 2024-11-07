import 'dart:convert';

import 'package:day16_pokedex_app/model/pokemon_details.dart';
import 'package:day16_pokedex_app/model/pokemon_page_response.dart';
import 'package:http/http.dart' as http;

class PokemonRepository {
  final baseUrl = 'pokeapi.co';
  final client = http.Client();

/*
  https://pokeapi.co/api/v2/pokemon?offset=200&limit=100
*/
  Future<PokemonPageResponse> getPokemonPage(int pageIndex) async {
    final queryParameters = {
      'limit': '200',
      'offset': (pageIndex * 200).toString()
    };
    final uri = Uri.https(baseUrl, '/api/v2/pokemon', queryParameters);

    final response = await client.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return PokemonPageResponse.fromJson(json);
    } else {
      throw Exception();
    }
  }

  Future<PokemonDetails> getPokemonDetails(int id) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon/$id/');
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return PokemonDetails.fromJson(json as Map<String, dynamic>);
    } else {
      throw Exception();
    }
  }
}
