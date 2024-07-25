import 'package:day04_flash_cards/flashcard_view.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import 'flashcard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Flashcard> _flashcards = [
    Flashcard(
        question: "What programming language does Flutter use?",
        answer: "Dart"),
    Flashcard(question: "Who you gonna call?", answer: "Ghost busters!"),
    Flashcard(
        question: "Who teaches you how to write sexy code?",
        answer: "Ya boi Kilo Loco!")
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flash Cards'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 250,
              width: 250,
              child: FlipCard(
                front: FlashCardView(text: _flashcards[_currentIndex].question),
                back: FlashCardView(text: _flashcards[_currentIndex].answer),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton.icon(
                  onPressed: showPrevCard,
                  icon: const Icon(Icons.chevron_left),
                  label: const Text('Prev'),
                ),
                OutlinedButton.icon(
                  onPressed: showNextCard,
                  label: const Text('Next'),
                  icon: const Icon(Icons.chevron_right),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void showPrevCard() {
    setState(() => _currentIndex =
        _currentIndex - 1 >= 0 ? _currentIndex - 1 : _flashcards.length - 1);
  }

  void showNextCard() {
    setState(() {
      _currentIndex =
          _currentIndex + 1 < _flashcards.length ? _currentIndex + 1 : 0;
    });
  }
}
