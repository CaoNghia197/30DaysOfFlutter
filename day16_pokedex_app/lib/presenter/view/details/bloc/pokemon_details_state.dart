import 'package:day16_pokedex_app/model/pokemon_details.dart';

abstract class PokemonDetailsState {}

class LoadingPokemonDetailsEvent extends PokemonDetailsState {}

class LoadedPokemonDetailsState extends PokemonDetailsState {
  final PokemonDetails pokemonDetails;

  LoadedPokemonDetailsState(this.pokemonDetails);
}
class FailedPokemonDetailsState extends PokemonDetailsState {
  final String error;

  FailedPokemonDetailsState(this.error);
}



