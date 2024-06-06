import 'package:flutter/material.dart';
import 'package:web_app_tec/utils/screen_size.dart';
import 'package:web_app_tec/widgets/popup_menu.dart';
import 'package:web_app_tec/widgets/separador_bar.dart';
import 'package:web_app_tec/widgets/title_bar.dart';

class HistorialDocumentosAdmin extends StatelessWidget {
  const HistorialDocumentosAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.i.upadate(context);
    return Scaffold(
      body: ListView(
        children: const [
          TitleBar(
              menu: PopupMenu(),
              nombreUsuario: 'nombreUsuario',
              puesto: 'puesto'),
          Separador(
              nombre: "Historial general de documentos",
              boton: TextButton(
                onPressed: null,
                child: Text(''),
              ))
        ],
      ),
    );
  }
}
