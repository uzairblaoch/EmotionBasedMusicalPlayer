import 'dart:convert';

import 'package:emp/Models/searchSongs.dart';
import 'package:http/http.dart' as http;

class Utils {
  final String baseUrl = 'ebmp.codingoverflow.com';
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

  forgot(
    String email,
  ) async {
    var url = Uri.http(baseUrl, '/api/forgot', {'q': 'dart'});
    final response = await http.post(url, body: {
      'email': email,
    });
    if (response.statusCode == 200) {
      final responseString = response.body;

      return jsonDecode(responseString);
    } else if (response.statusCode == 404) {
      final responseString = response.body;
      return jsonDecode(responseString);
    }
  }

  checktokenApi(String email, String token) async {
    var url = Uri.http(baseUrl, '/api/checkToken', {'q': 'dart'});
    final response =
        await http.post(url, body: {'email': email, 'token': token});
    // print(email);
    // print(token);
    print(response);
    if (response.statusCode == 200) {
      final responseString = response.body;
      print(responseString);
      return jsonDecode(responseString);
    } else if (response.statusCode == 400) {
      final responseString = response.body;
      print(responseString);
      return jsonDecode(responseString);
    }
  }

  Future<SearchSongs> fetchSongs() async {
    var url = Uri.parse('https://api.deezer.com/search?q=hindi songs');
    final response = await http.get(url);
    //print(response.body);
    return SearchSongs.fromJson(jsonDecode(response.body));
  }

  /*getMe() async {
    var url = Uri.parse('https://api.deezer.com/search?q=Sad Songs');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return (jsonDecode(responseString));
    }
  }*/
}
