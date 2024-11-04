import 'package:day15_bloc_navigator/presenter/bloc/post_bloc.dart';
import 'package:day15_bloc_navigator/presenter/bloc/post_event.dart';
import 'package:day15_bloc_navigator/presenter/nav/nav_cubit.dart';
import 'package:day15_bloc_navigator/presenter/nav/navigator_view.dart';
import 'package:day15_bloc_navigator/presenter/view/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
              centerTitle: true,
              iconTheme: IconThemeData(color: Colors.white),
              color: Colors.blue,
              titleTextStyle:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.w600))),
      home: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => NavCubit()),
        BlocProvider(
          create: (context) => PostBloc()..add(LoadPostEvent()),
          child: const HomePage(),
        )
      ], child: const NavigatorView()),
    );
  }
}
