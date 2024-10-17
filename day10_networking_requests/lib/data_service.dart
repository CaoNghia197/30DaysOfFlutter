import 'package:http/http.dart' as http;

class DataService {
  //https://fastapiproject-1-eziw.onrender.com/blue
  Future<String> makeRequestToApi() async {
    final uri = Uri.https('fastapiproject-1-eziw.onrender.com', 'blue');
    final response = await http.get(uri);
    return response.body;
  }
}
