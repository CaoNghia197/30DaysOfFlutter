import 'dart:math';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final WebViewController _controller;
  late final Future<WebViewController> future;
  var loadingPercentage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(onPageStarted: (url) {
        setState(() {
          loadingPercentage = 0;
        });
      }, onProgress: (progress) {
        setState(() {
          loadingPercentage = progress;
        });
      }, onPageFinished: (url) {
        setState(() {
          loadingPercentage = 100;
        });
      }))
      ..loadRequest(Uri.parse('https://kiloloco.com/'));

    future = Future(() => _controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Youtube')),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (loadingPercentage < 100)
            LinearProgressIndicator(
              value: loadingPercentage / 100.0,
            ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.only(right: 8, bottom: 8),
          child: ButtonBar(
            children: [
              navigationButton(
                  Icons.chevron_left, (controller) => _goBack(controller)),
              navigationButton(
                  Icons.chevron_right, (controller) => _goForward(controller)),
              navigationButton(
                  Icons.replay_rounded, (controller) => _goReload(controller)),
            ],
          ),
        ),
      ),
    );
  }

  Widget navigationButton(
      IconData icon, Function(WebViewController) onPressed) {
    return FutureBuilder<WebViewController>(
        future: future,
        builder:
            (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
          if (snapshot.hasData) {
            return IconButton(
                icon: Icon(icon),
                color: Colors.white,
                onPressed: () => onPressed(snapshot.data!));
          } else {
            return Container();
          }
        });
  }

  void _goBack(WebViewController controller) async {
    final canGoBack = await controller.canGoBack();
    if (canGoBack) {
      controller.goBack();
    } else {
      print('not can go back!');
    }
  }

  void _goForward(WebViewController controller) async {
    final canGoForward = await controller.canGoForward();
    if (canGoForward) {
      controller.goForward();
    } else {
      print('not can go forward!');
    }
  }

  void _goReload(WebViewController controller) {
    controller.reload();
  }
}
