import 'package:day16_pokedex_app/presenter/nav/navigator_cubit.dart';
import 'package:day16_pokedex_app/presenter/nav/navigator_view.dart';
import 'package:day16_pokedex_app/presenter/view/home/bloc/pokemon_bloc.dart';
import 'package:day16_pokedex_app/presenter/view/home/bloc/pokemon_event.dart';
import 'package:day16_pokedex_app/presenter/view/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.red,
            background: Colors.white,
            error: Colors.red,
            onTertiary: Colors.orange),
        useMaterial3: true,
        fontFamily: GoogleFonts.abel(fontWeight: FontWeight.bold).fontFamily,
        appBarTheme: AppBarTheme(
          color: Colors.red,
          shadowColor: Colors.red,
          elevation: 4,
          foregroundColor: Colors.white,
          centerTitle: true,
          titleTextStyle: GoogleFonts.abel(fontSize: 24),
        ),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => NavigatorCubit()),
          BlocProvider(
              create: (context) => PokemonBloc()..add(LoadPokemonEvent(0)))
        ],
        child: const NavigatorView(),
      ),
    );
  }
}

/*BlocProvider(
create: (context) => PokemonBloc()..add(LoadPokemonEvent(0)),
child: const HomePage(),
)*/
