import 'package:day16_pokedex_app/presenter/nav/navigator_cubit.dart';
import 'package:day16_pokedex_app/presenter/view/details/bloc/pokemon_details_bloc.dart';
import 'package:day16_pokedex_app/presenter/view/details/bloc/pokemon_details_event.dart';
import 'package:day16_pokedex_app/presenter/view/home/bloc/pokemon_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/pokemon_bloc.dart';
import 'bloc/pokemon_event.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('POKÉMON'),
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadState) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<PokemonBloc>().add(PullToRefreshEvent(1));
              },
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: state.response.pokemonListings.length,
                itemBuilder: (context, index) {
                  final pokemon = state.response.pokemonListings[index];

                  return Card(
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      onTap: () {
                        // Sử dụng NavigatorCubit để điều hướng, không tạo Bloc mới trong onTap
                        context.read<NavigatorCubit>().showDetailsPokemon(pokemon.id);

                        // Tạo và thêm sự kiện vào PokemonDetailsBloc trước khi điều hướng
                        final pokemonDetailsBloc = BlocProvider.of<PokemonDetailsBloc>(context);
                        pokemonDetailsBloc.add(LoadedPokemonDetailsEvent(pokemon.id));
                      },
                      child: GridTile(
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.network(pokemon.url),
                            ),
                            Text(pokemon.name),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (state is FailedState) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
