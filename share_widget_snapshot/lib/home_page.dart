import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final image = 'assets/images/code_passionately.png';
  final _screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Share Widget Snapshot"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Screenshot(
              controller: _screenshotController,
              child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Image.asset(image),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'Code Passionately',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )),
            ),
            TextButton(
                onPressed: _takeScreenshot,
                child: const Text('Take Screenshot and Share'))
          ],
        ),
      ),
    );
  }

  Future<void> _takeScreenshot() async {
    await _screenshotController.capture().then((image) async {
      final directory = await getApplicationDocumentsDirectory();
      final imagePath = await File('${directory.path}/code_passionately.png').create();
      await imagePath.writeAsBytes(image as Uint8List);
      await Share.shareFiles([imagePath.path]);
    });
  }
}
