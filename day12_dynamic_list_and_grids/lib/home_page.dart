import 'package:day12_dynamic_list_and_grids/models.dart';
import 'package:day12_dynamic_list_and_grids/widgets/grid_page.dart';
import 'package:day12_dynamic_list_and_grids/widgets/list_page.dart';
import 'package:flutter/material.dart';

import 'data_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _dataService = DataService();
  Data? response;
  final List<Tab> tabs = <Tab>[
    const Tab(
      text: 'LIST',
      icon: Icon(Icons.list_outlined),
    ),
    const Tab(
      text: 'GRID',
      icon: Icon(Icons.grid_3x3_outlined),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    final data = await _dataService.getNowPlaying();
    setState(() => response = data);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(tabs: tabs),
          ),
          body: TabBarView(children: [
            Builder(builder: (_) {
              if (response == null) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListPage(results: response!.results);
            }),
            Builder(builder: (_) {
              if (response == null) {
                return const Center(child: CircularProgressIndicator());
              }
              return GridPage(results: response!.results);
            })
          ]),
        ));
  }
}
