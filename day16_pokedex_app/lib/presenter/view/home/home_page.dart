import 'package:day16_pokedex_app/presenter/view/bloc/pokemon_bloc.dart';
import 'package:day16_pokedex_app/presenter/view/bloc/pokemon_event.dart';
import 'package:day16_pokedex_app/presenter/view/bloc/pokemon_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        title: const Text('POKÉ'),
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(builder: (context, state) {
        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LoadState) {
          return RefreshIndicator(
            onRefresh: () async =>
                context.read<PokemonBloc>().add(PullToRefreshEvent(1)),
            child: GridView.count(
                crossAxisCount: 3,
                children: state.response.pokemonListings
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: GridTile(
                                child: Column(
                              children: [
                                Image.network(e.url),
                                Text(e.name),
                              ],
                            )),
                          ),
                        ))
                    .toList()),
          );
        } else if (state is FailedState) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
