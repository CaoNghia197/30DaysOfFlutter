import 'package:day11_weather_app/data_service.dart';
import 'package:day11_weather_app/model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherInfo? _response;
  final _cityTextFieldController = TextEditingController();
  final _dataService = DataService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Builder(builder: (_) {
              if (_response == null) {
                return const CircularProgressIndicator();
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                        'https://openweathermap.org/img/wn/${_response!.weather[0].icon}@2x.png'),
                    Text(
                        '${(_response!.main.tempMin - 273.15).toStringAsFixed(1)}°',
                        style: GoogleFonts.roboto(
                          fontSize: 42.0,
                        )),
                  ],
                );
              }
            }),
            const SizedBox(height: 42.0),
            SizedBox(
                width: 150.0,
                child: TextField(
                  controller: _cityTextFieldController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(labelText: "City"),
                )),
            const SizedBox(height: 42.0),
            ElevatedButton(onPressed: _search, child: const Text('Search')),
          ],
        ),
      ),
    );
  }

  void _search() async {
    try {
      final response =
          await _dataService.getWeather(_cityTextFieldController.text);
      setState(() => _response = response);
    } catch (e) {
      print(e.toString());
    }
  }
}
