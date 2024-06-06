import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_app_tec/api/endpoints.dart';
import 'package:web_app_tec/models/usuario_global.dart';
import 'package:web_app_tec/models/usuario_model_all.dart';

class UsersService {
  static const String _baseUrl = urlBase;
  static const String _getUsersByNameEndpoint = '/users/search';

  static Future<UserGeneral> getAll(String token, int page) async {
    final url = Uri.parse('$_baseUrl/users?page=$page&limit=50');
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'authorization': "Bearer $token"
      },
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final response2 = UserGeneral.fromJson(jsonResponse);
      return response2;
    } else if (response.statusCode == 500) {
      throw Exception('error del servidor');
    } else if (response.statusCode == 404) {
      throw Exception('Users not found');
    } else {
      throw Exception('Failed to connect');
    }
  }

  static Future<UserGlobal> findById(String token, String userId) async {
    final url = Uri.parse('$_baseUrl/users/$userId');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'authorization': "Bearer $token"
      },
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final response2 = UserGlobal.fromJson(jsonResponse);
      return response2;
    } else if (response.statusCode == 500) {
      throw Exception('error del servidor');
    } else if (response.statusCode == 404) {
      throw Exception('User not found');
    } else {
      throw Exception('Failed to connect');
    }
  }

  static Future<UserGeneral> getUsersByName(String name, String token,
      {int page = 1, int limit = 10}) async {
    try {
      final response = await http.get(
        Uri.parse(
            '$_baseUrl$_getUsersByNameEndpoint?nombre=$name&page=$page&limit=$limit'),
        headers: {
          'Content-Type': 'application/json',
          'authorization': "Bearer $token"
        },
      );

      if (response.statusCode == 200) {
        // Success
        final responseData = jsonDecode(response.body);
        final response2 = UserGeneral.fromJson(responseData);
        return response2; // Extract and cast user data
      } else {
        // Handle error
        final errorData = jsonDecode(response.body);
        throw Exception(errorData['error'] ?? 'Error fetching users');
      }
    } catch (error) {
      // Handle general error
      throw Exception('Error searching users: $error');
    }
  }
}
