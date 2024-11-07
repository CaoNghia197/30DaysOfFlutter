import 'package:day16_pokedex_app/data/pokemon_repository.dart';
import 'package:day16_pokedex_app/presenter/view/details/bloc/pokemon_details_event.dart';
import 'package:day16_pokedex_app/presenter/view/details/bloc/pokemon_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonDetailsBloc
    extends Bloc<PokemonDetailsEvent, PokemonDetailsState> {
  final _repository = PokemonRepository();

  PokemonDetailsBloc() : super(LoadingPokemonDetailsEvent()) {
    on<PokemonDetailsEvent>(_onEvent);
  }

  Future<void> _onEvent(
      PokemonDetailsEvent event, Emitter<PokemonDetailsState> emit) async {
    return switch (event) {
      LoadedPokemonDetailsEvent e => _getPokemonDetails(e, emit),
      PullToRefreshDetailsEvent e => _getPokemonDetails(e, emit),
      PokemonDetailsEvent() => throw UnimplementedError(),
    };
  }

  void _getPokemonDetails(
      PokemonDetailsEvent event, Emitter<PokemonDetailsState> emit) async {
    emit(LoadingPokemonDetailsEvent());
    try {
      final pokemonDetails = await _repository.getPokemonDetails(event.id);
      emit(LoadedPokemonDetailsState(pokemonDetails));
    } catch (e) {
      emit(FailedPokemonDetailsState(e.toString()));
    }
  }
}
