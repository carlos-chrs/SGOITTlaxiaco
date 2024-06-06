import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_app_tec/api/endpoints.dart';
import 'package:web_app_tec/models/usuario_model.dart';

class Aunth {
  static const String _baseUrl = urlBase;

  Future<UsuarioLocal> login(String email, String password) async {
    final url = Uri.parse('$_baseUrl/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final user = UsuarioLocal.fromJson(jsonResponse);
      return user;
    } else if (response.statusCode == 401) {
      throw Exception('Invalid password');
    } else if (response.statusCode == 404) {
      throw Exception('User not found');
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<String> logOut(String token) async {
    final url = Uri.parse('$_baseUrl/logout');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'accessToken': token}),
    );
    if (response.statusCode == 200) {
      return "success";
    } else if (response.statusCode == 500) {
      return "error";
    } else if (response.statusCode == 404) {
      return "sesion no activa";
    } else {
      return 'Failed to logout';
    }
  }

  Future<bool> registerUser(
      {required name,
      required email,
      required password,
      required permissionLevel,
      required token}) async {
    final url = Uri.parse('$_baseUrl/register');
    final headers = {
      'Content-Type': 'application/json',
      'authorization': "Bearer $token"
    };
    print(password);
    final body = {
      'name': name,
      'email': email,
      'password': password,
      'newPassword': password,
      'permissionLevel': permissionLevel,
    };

    final response =
        await http.post(url, headers: headers, body: jsonEncode(body));

    if (response.statusCode == 201) {
      return true;
    } else {
      final error = jsonDecode(response.body)['message'];
      print('Error al registrar usuario: ${response.body}');
      return false;
    }
  }

  Future<String?> refreshToken(String refreshToken) async {
    final url =
        Uri.parse('$_baseUrl/refreshToken'); // Replace with your actual API URL
    final headers = {'Content-Type': 'application/json'};
    final body = {'refreshToken': refreshToken};

    final response =
        await http.post(url, headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;
      final accessToken = decodedResponse['accessToken'];
      print('Access token refreshed: $accessToken');
      return accessToken;
    } else {
      final error = jsonDecode(response.body)['error'];
      print('Error refreshing token: $error');
      return null;
    }
  }

  Future<bool> changeForgottenPassword(String newPassword) async {
    final url = Uri.parse(
        '$_baseUrl/changeForgottenPassword'); // Replace with your actual API URL
    final headers = {'Content-Type': 'application/json'};
    final body = {'newPassword': newPassword};

    final response =
        await http.put(url, headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
      print('Contraseña restablecida exitosamente');
      return true;
    } else {
      final error = jsonDecode(response.body)['error'];
      print('Error al restablecer la contraseña: $error');
      return false;
    }
  }
}
