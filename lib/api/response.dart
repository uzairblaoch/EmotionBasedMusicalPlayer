import 'dart:convert';

import 'package:http/http.dart' as http;

class Utils {
  final String baseUrl = '192.168.10.3:8000';
  register(String first_name, String last_name, String email, String password,
      String confirm_pasword) async {
    var url = Uri.http(baseUrl, '/api/register', {'q': 'dart'});
    final response = await http.post(url, body: {
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'password': password,
      'password_confirmation': confirm_pasword
    });
    if (response.statusCode == 200) {
      final responseString = response.body;

      return jsonDecode(responseString);
    }
  }

  login(
    String email,
    String password,
  ) async {
    var url = Uri.http(baseUrl, '/api/login', {'q': 'dart'});
    final response = await http.post(url, body: {
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      final responseString = response.body;

      return jsonDecode(responseString);
    } else if (response.statusCode == 401) {
      final responseString = response.body;
      return jsonDecode(responseString);
    }
  }
}
