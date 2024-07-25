import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _fontSize = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Easy Read'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                textInputAction: TextInputAction.none,
                style: TextStyle(fontSize: _fontSize),
                maxLines: null,
              ),
            ),
            Slider(
              value: _fontSize,
              onChanged: (value) => setState(() {
                _fontSize = value;
              }),
              min: 30,
              max: 100,
            )
          ],
        ),
      ),
    );
  }
}
