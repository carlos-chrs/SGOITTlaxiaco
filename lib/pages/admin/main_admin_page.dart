import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web_app_tec/prividers/login_provider.dart';
import 'package:web_app_tec/prividers/users_provoder.dart';
import 'package:web_app_tec/utils/screen_size.dart';
import 'package:web_app_tec/widgets/custombuttom.dart';
import 'package:web_app_tec/widgets/popup_menu.dart';
import 'package:web_app_tec/widgets/separador_bar.dart';
import 'package:web_app_tec/widgets/title_bar.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.i.upadate(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TitleBar(
                menu: const PopupMenu(),
                nombreUsuario:
                    context.watch<LoginProvider>().usuarioLocal!.name!,
                puesto: ''),
            Container(
              width: ScreenSize.i.width,
              height: 200,
              alignment: Alignment.center,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 60.0, horizontal: 8.0),
                      child: CustomButtom(
                        action: () async {
                          await context.read<UsersProvider>().findAllUsers(
                              context
                                  .read<LoginProvider>()
                                  .usuarioLocal!
                                  .token!,
                              1);
                          context.go("/admin_usuaios");
                        },
                        text: 'Administrar \n Usuarios',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 60.0, horizontal: 8.0),
                      child: CustomButtom(
                        action: () {
                          context.go("/crear_documento");
                        },
                        text: 'Nuevo Documento \n Departamento',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 60.0, horizontal: 8.0),
                      child: CustomButtom(
                        action: () {},
                        text: 'Configuracion',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Separador(
                nombre: "Historial general de documentos",
                boton: TextButton(
                  onPressed: () {},
                  child: const Text('ver mas'),
                ))
          ],
        ),
      ),
    );
  }
}
