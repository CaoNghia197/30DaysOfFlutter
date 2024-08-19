import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _imagePath = [
    "assets/images/day01.png",
    "assets/images/day02.png",
    "assets/images/day03.png",
    "assets/images/day04.png",
    "assets/images/day05.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: CarouselSlider(
          items: _imagePath.map((item) {
            return Builder(builder: (BuildContext context) {
              return Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/4,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 8.0),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Image.asset(item),
                        Container(
                          height: MediaQuery.of(context).size.height / 8,
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          alignment: Alignment.bottomLeft,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              Colors.black.withAlpha(0),
                              Colors.black45,
                              Colors.black
                            ],
                          )),
                          child: Text(
                            item,
                            style:
                                const TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Align(
                  //     alignment: Alignment.bottomCenter,
                  //     child: Text(
                  //       "Day 1",
                  //       textAlign: TextAlign.center,
                  //       style: TextStyle(
                  //           color: Colors.black, fontWeight: FontWeight.bold),
                  //     ))
                ],
              );
            });
          }).toList(),
          options: CarouselOptions(
            autoPlay: true,
            // enlargeCenterPage: true,
          )),
    );
  }
}
