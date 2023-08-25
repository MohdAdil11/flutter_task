import 'dart:convert';
import 'package:http/http.dart' as http;



class API {
  static getData() async {
    final response = await http.get(Uri.parse(
        "https://api.mfapi.in/mf/119063"),
        headers: <String, String>{
          'accept': 'application/json',
        });
      print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    }
  }
}
