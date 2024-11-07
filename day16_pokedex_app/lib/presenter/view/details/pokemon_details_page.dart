import 'package:day16_pokedex_app/model/pokemon_details.dart';
import 'package:day16_pokedex_app/presenter/view/details/bloc/pokemon_details_bloc.dart';
import 'package:day16_pokedex_app/presenter/view/details/bloc/pokemon_details_event.dart';
import 'package:day16_pokedex_app/presenter/view/details/bloc/pokemon_details_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonDetailsPage extends StatelessWidget {
  final int id;

  const PokemonDetailsPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: BlocBuilder<PokemonDetailsBloc, PokemonDetailsState>(
        builder: (context, state) {
          if (state is LoadingPokemonDetailsEvent) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadedPokemonDetailsState) {
            return RefreshIndicator(
              onRefresh: () async => context
                  .read<PokemonDetailsBloc>()
                  .add(PullToRefreshDetailsEvent(id)),
              child: Column(
                children: [
                  _widgetDetailsTop(state.pokemonDetails),
                  Expanded(
                    flex: 2,
                    child: Card(
                        child: Center(
                      child: Text('$id'),
                    )),
                  )
                ],
              ),
            );
          } else if (state is FailedPokemonDetailsState) {
            return Center(child: Text(state.error));
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _widgetDetailsTop(PokemonDetails pokemonDetails) {
    return Expanded(
        flex: 1,
        child: Card(
          child: Column(
            children: [
              Expanded(
                  child: Image.network(pokemonDetails.sprites.frontDefault)),
              Text(pokemonDetails.name)
            ],
          ),
        ));
  }
}

/*
Column(
children: <Widget>[
_widgetDetailsTop(),
Expanded(
flex: 2,
child: Card(
child: Center(
child: Text('$id'),
)),
)
],
),
*/
