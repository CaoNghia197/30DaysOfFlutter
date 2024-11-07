import 'package:day16_pokedex_app/model/pokemon_page_response.dart';

abstract class PokemonState {}

class LoadingState extends PokemonState{}

class LoadState extends PokemonState {
  final PokemonPageResponse response;

  LoadState(this.response);
}

class FailedState extends PokemonState {
  final String message;

  FailedState(this.message);
}
