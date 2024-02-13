import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class Api {
  static final String baseUrl = 'http://10.10.11.223:3000/api';

  static final String loginEndpoint = '$baseUrl/users';
  static final String registerEndpoint = '$baseUrl/users/register';
  // static final String userEndpoint = '$baseUrl/user';

  static Future<Map<String, String>> getHeaders() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? token = localStorage.getString('token');
    print(token);

    if (token != null) {
      return {'Authorization': 'Bearer $token'};
    } else {
      return {};
    }
  }

  auth(data, apiUrl) async {
    var fullUrl = baseUrl + apiUrl;
    return await http.post(Uri.parse(fullUrl),
        body: data, headers: await getHeaders());
  }

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? token = jsonDecode(localStorage.getString('token') ?? '')['token'];
    return token;
  }

  getUserData(apiUrl) async {
    var fullUrl = baseUrl + apiUrl;
    await _getToken();
    return await http.get(
      Uri.parse(fullUrl),
      headers: await getHeaders(),
    );
  }
}
