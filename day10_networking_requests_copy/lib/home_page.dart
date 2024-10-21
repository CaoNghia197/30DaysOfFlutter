import 'package:day10_networking_requests_copy/data_service.dart';
import 'package:day10_networking_requests_copy/model/new.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<New>? _response;
  final _dataService = DataService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App connect network'),
      ),
      body: Center(
        child: Builder(builder: (context) {
          if (_response != null) {
            return ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: _response!.length,
                itemBuilder: (context, index) => ListTile(
                      title: Text(_response![index].title),
                      subtitle: Text(_response![index].published),
                      trailing: _response![index].image.isEmpty
                          ? Image.network('https://www.first.org/_/img/news/firstpost2409-chair-news.jpg')
                          : Image.network(_response![index].image),
                    ));
          } else {
            return TextButton(
                onPressed: _makeRequests, child: const Text('Make Request'));
          }
        }),
      ),
    );
  }

  void _makeRequests() async {
    final response = await _dataService.makeRequest();
    setState(() {
      _response = response;
    });
  }
}
