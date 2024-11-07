import 'package:day16_pokedex_app/presenter/view/details/pokemon_details_page.dart';
import 'package:day16_pokedex_app/presenter/view/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigator_cubit.dart';

class NavigatorView extends StatelessWidget {
  const NavigatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigatorCubit, int?>(builder: (_, id) {
      return Navigator(
        pages: [
          const MaterialPage(child: HomePage()),
          if (id != null) MaterialPage(child: PokemonDetailsPage(id: id))
        ],
        onPopPage: (router, result) => router.didPop(result),
      );
    });
  }
}
