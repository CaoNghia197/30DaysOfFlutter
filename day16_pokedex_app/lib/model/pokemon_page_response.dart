/*
{
  "count": 1302,
  "next": "https://pokeapi.co/api/v2/pokemon?offset=300&limit=100",
  "previous": "https://pokeapi.co/api/v2/pokemon?offset=100&limit=100",
  "results": [
    {
      "name": "unown",
      "url": "https://pokeapi.co/api/v2/pokemon/201/"
    },
    {
      "name": "wobbuffet",
      "url": "https://pokeapi.co/api/v2/pokemon/202/"
    }
    ]
    }
*/
class PokemonListing {
  final int id;
  final String name;

  String get url => 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

  PokemonListing(this.id, this.name);

  factory PokemonListing.fromJson(Map<String, dynamic> json) {
    final String name = json['name'];
    final String url = json['url'] as String;
    final id = int.parse(url.split('/')[6]);
    return PokemonListing(id, name);
  }
}

class PokemonPageResponse {
  final List<PokemonListing> pokemonListings;
  final bool canLoadNextPage;

  PokemonPageResponse(this.pokemonListings, this.canLoadNextPage);

  factory PokemonPageResponse.fromJson(Map<String, dynamic> json) {
    final pokemonListings = (json['results'] as List)
        .map((e) => PokemonListing.fromJson(e as Map<String, dynamic>))
        .toList();
    final canLoadNextPage = json['next'] != null;
    return PokemonPageResponse(pokemonListings, canLoadNextPage);
  }
}
