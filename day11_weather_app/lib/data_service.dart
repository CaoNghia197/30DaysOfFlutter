import 'package:http/http.dart' as http;
import 'model.dart';

class DataService {
  Future<WeatherInfo> getWeather(String city) async {
    final queryParameters = {
      'q': city,
      'appid': '027e16b4793881444de62f73e055a81d',
    };
    Uri uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return weatherInfoFromJson(response.body);
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
