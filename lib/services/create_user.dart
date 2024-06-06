import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_app_tec/api/endpoints.dart';

class LoginAunth {
  static const String _baseUrl = urlBase;

  Future<String> login(String email, String password) async {
    final url = Uri.parse('$_baseUrl/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final token = jsonResponse['accessToken'];
      return token;
    } else if (response.statusCode == 401) {
      throw Exception('Invalid password');
    } else if (response.statusCode == 404) {
      throw Exception('User not found');
    } else {
      throw Exception('Failed to login');
    }
  }
}
