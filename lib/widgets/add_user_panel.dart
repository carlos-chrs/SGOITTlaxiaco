// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_app_tec/prividers/login_provider.dart';
import 'package:web_app_tec/prividers/users_provoder.dart';
import 'package:web_app_tec/services/aunth_service.dart';

class AddUserPanel extends StatefulWidget {
  const AddUserPanel({super.key});

  @override
  _AddUserPanelState createState() => _AddUserPanelState();
}

class _AddUserPanelState extends State<AddUserPanel> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _correoController = TextEditingController();
  final _contrasenaController = TextEditingController();
  final _nivelPermisosController = TextEditingController();

  void _enviarFormulario(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      // Capturar los valores de los campos de texto
      final nombre = _nombreController.text;
      final correo = _correoController.text;
      final contrasena = _contrasenaController.text;
      final nivelPermisos = _nivelPermisosController.text;

      bool res = await Aunth().registerUser(
        name: nombre,
        email: correo,
        password: contrasena,
        permissionLevel: nivelPermisos,
        token: context.read<LoginProvider>().usuarioLocal!.token!,
      );
      if (res) {
        context.read<UsersProvider>().findAllUsers(
            context.read<LoginProvider>().usuarioLocal!.token!, 1);
      }
      // Procesar la información del formulario (p.ej., enviar a un servidor)

      // Limpiar los campos de texto
      _nombreController.clear();
      _correoController.clear();
      _contrasenaController.clear();
      _nivelPermisosController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _nombreController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, introduce tu nombre';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _correoController,
              decoration: const InputDecoration(
                labelText: 'Correo electrónico',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, introduce tu correo electrónico';
                }
                if (!RegExp(r'^.+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                    .hasMatch(value)) {
                  return 'Introduce un correo electrónico válido';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _contrasenaController,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
              ),
              obscureText: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, introduce tu contraseña';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _nivelPermisosController,
              decoration: const InputDecoration(
                labelText: 'Nivel de permisos',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, introduce tu nivel de permisos';
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                _enviarFormulario(context);
              },
              child: const Text('Enviar formulario'),
            ),
          ],
        ),
      ),
    );
  }
}
