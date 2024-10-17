import 'package:day10_networking_requests/data_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final service = DataService();
  var _response;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Networking'),
      ),
      body: Center(child: Builder(builder: (context) {
        if (_response == null ) {
          return ElevatedButton(
              onPressed: _makeRequest, child: const Text('Make Request'));
        } else {
          return Text(_response, textAlign: TextAlign.center,);
        }
      })),
    );
  }

  void _makeRequest() async {
    final response = await service.makeRequestToApi();
    setState(() => _response = response);
  }
}
