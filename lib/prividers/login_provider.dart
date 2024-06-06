import 'package:flutter/material.dart';
import 'package:web_app_tec/models/usuario_model.dart';
import 'package:web_app_tec/services/aunth_service.dart';

class LoginProvider with ChangeNotifier {
  UsuarioLocal? _usuarioLocal;

  UsuarioLocal? get usuarioLocal => _usuarioLocal;
  bool _loading = false;
  bool get authenticated => _usuarioLocal != null;
  bool get loading => _loading;

  // Método para actualizar el token
  void updateToken(String newToken) {
    _usuarioLocal!.token = newToken;
    notifyListeners();
  }

  void updateloader(bool newState) {
    _loading = newState;
    notifyListeners();
  }

  Future<UsuarioLocal?> login(String username, String password) async {
    UsuarioLocal? newUser;
    try {
      newUser = await Aunth().login(username, password);
      _usuarioLocal = newUser;
      notifyListeners();
      return newUser;
    } catch (e) {
      return null;
    }
  }

  // Método para cerrar la sesión
  void logout() async {
    try {
      if (_usuarioLocal != null) {
        String status = await Aunth().logOut(_usuarioLocal!.token!);
        if (status == "success") {
          _usuarioLocal = null;
        }
        _usuarioLocal = null;
      }
    } catch (e) {
      //
    }
    notifyListeners();
  }
}
