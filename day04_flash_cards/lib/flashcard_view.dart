import 'package:flutter/material.dart';

class FlashCardView extends StatelessWidget {
  const FlashCardView({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Center(
          child: Text(
        text,
        textAlign: TextAlign.center,
      )),
    );
  }
}
