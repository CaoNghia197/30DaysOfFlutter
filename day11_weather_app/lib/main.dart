import 'package:day11_weather_app/home_page.dart';
import 'package:flutter/material.dart';
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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          appBarTheme: AppBarTheme(
              color: Colors.blue,
              centerTitle: true,
              titleTextStyle: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ))),
      home: const HomePage(),
    );
  }
}
