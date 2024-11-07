import 'package:day16_pokedex_app/model/pokemon_page_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigatorCubit extends Cubit<int?> {
  NavigatorCubit() : super(null);

  showDetailsPokemon(int id) => emit(id);

  hideDetailsPokemon() => emit(null);
}
