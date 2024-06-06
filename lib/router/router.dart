import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web_app_tec/models/usuario_model.dart';
import 'package:web_app_tec/pages/admin/admin_users.dart';
import 'package:web_app_tec/pages/admin/main_admin_page.dart';
import 'package:web_app_tec/pages/crear_documento_page.dart';
import 'package:web_app_tec/pages/crear_documento_quill.dart';
import 'package:web_app_tec/pages/editor_texto_quill.dart';
import 'package:web_app_tec/pages/inicio_usuario.dart';
import 'package:web_app_tec/pages/login.dart';
import 'package:web_app_tec/prividers/login_provider.dart';

Widget isAdmin(UsuarioLocal? userLocal) {
  return userLocal!.permissionLevel == 1
      ? const AdminHome()
      : const InicioUsuario();
}

getRouter(BuildContext context) {
  UsuarioLocal? userLocal = context.watch<LoginProvider>().usuarioLocal;

  final GoRouter router = GoRouter(
    redirect: (BuildContext context, GoRouterState state) {
      if (userLocal == null) {
        return '/login';
      } else {
        return null;
      }
    },
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return userLocal != null ? isAdmin(userLocal) : LoginPage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'login',
            builder: (BuildContext context, GoRouterState state) {
              return LoginPage();
            },
          ),
          GoRoute(
            path: 'crear_documento',
            builder: (BuildContext context, GoRouterState state) {
              return CrearDocumento(
                title: '',
              );
            },
          ),
          GoRoute(
            path: 'ver_documento',
            builder: (BuildContext context, GoRouterState state) {
              return CrearDocumentoPage();
            },
          ),
          GoRoute(
            path: 'admin_usuaios',
            builder: (BuildContext context, GoRouterState state) {
              return AdminUsersPage();
            },
          ),
        ],
      ),
    ],
  );
  return router;
}
