import 'package:day16_pokedex_app/model/pokemon_details.dart';

abstract class PokemonDetailsEvent {
  final int id;

  PokemonDetailsEvent(this.id);
}

class LoadedPokemonDetailsEvent extends PokemonDetailsEvent {
  LoadedPokemonDetailsEvent(super.id);
}

class PullToRefreshDetailsEvent extends PokemonDetailsEvent {
  PullToRefreshDetailsEvent(super.id);
}
