import 'package:flutter/material.dart';
import 'package:day05_show_webview/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.blue,
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
