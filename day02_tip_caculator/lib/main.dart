import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final controller = TextEditingController();
  final _selection = [true, false, false];
  String? tip;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (tip != null)
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    tip!,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              const Text('Total Amount'),
              SizedBox(
                width: 70,
                child: TextField(
                  controller: controller,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(hintText: '\$100.00'),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ToggleButtons(
                  isSelected: _selection,
                  onPressed: updateSelection,
                  children: const [
                    Text('10%'),
                    Text('15%'),
                    Text('20%'),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: calculateTip,
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.green)),
                child: const Text(
                  'Calculator Tip',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void updateSelection(int selectionIndex) {
    setState(() {
      for (int i = 0; i < _selection.length; i++) {
        _selection[i] = selectionIndex == i;
      }
    });
  }

  void calculateTip() {
    final totalAmount = double.parse(controller.text);
    final selectedIndex = _selection.indexWhere((element) => element);
    final tipPercentage = [0.1, 0.15, 0.2][selectedIndex];
    final tipTotal = (totalAmount * tipPercentage).toStringAsFixed(2);
    setState(() {
      tip = '\$$tipTotal';
    });
  }
}
