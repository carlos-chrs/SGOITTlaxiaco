import 'package:flutter/material.dart';
import 'package:web_app_tec/models/usuario_model_all.dart';
import 'package:web_app_tec/services/users_service.dart';

class UsersProvider with ChangeNotifier {
  UserGeneral? _users;

  UserGeneral? get users => _users;

  // Método para actualizar la lista de usuarios
  void updateUsers(UserGeneral? users) {
    _users = users;
    notifyListeners();
  }

  Future<void> findAllUsers(String token, int page) async {
    try {
      _users = await UsersService.getAll(token, page);
      notifyListeners();
      print(_users);
    } catch (e) {
      print(e);
    }
  }

  // Método para cerrar la sesión
}
