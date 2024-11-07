import 'package:day16_pokedex_app/data/pokemon_repository.dart';
import 'package:day16_pokedex_app/presenter/view/home/bloc/pokemon_event.dart';
import 'package:day16_pokedex_app/presenter/view/home/bloc/pokemon_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final repository = PokemonRepository();

  PokemonBloc() : super(LoadingState()) {
    on<PokemonEvent>(_onEvent);
  }

  Future<void> _onEvent(PokemonEvent event, Emitter<PokemonState> emit) async {
    return switch (event) {
      LoadPokemonEvent e => _getPokemonPage(e, emit),
      PullToRefreshEvent e => _getPokemonPage(e, emit),
      PokemonEvent() => throw UnimplementedError(),
    };
  }

  void _getPokemonPage(PokemonEvent event, Emitter<PokemonState> emit) async {
    if (event is LoadPokemonEvent || event is PullToRefreshEvent) {
      emit(LoadingState());
      try {
        final response = await repository.getPokemonPage(event.page);
        emit(LoadState(response));
      } catch (e) {
        emit(FailedState(e.toString()));
      }
    }
  }
}
