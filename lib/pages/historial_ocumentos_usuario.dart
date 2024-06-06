import 'package:flutter/material.dart';
import 'package:web_app_tec/utils/screen_size.dart';
import 'package:web_app_tec/widgets/cuadro_info_document.dart';
import 'package:web_app_tec/widgets/custom_search_tab_bar.dart';
import 'package:web_app_tec/widgets/custom_table.dart';
import 'package:web_app_tec/widgets/title_bar.dart';

class HistorialDocumentosUsuarios extends StatelessWidget {
  const HistorialDocumentosUsuarios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.i.upadate(context);
    return Scaffold(
      body: SizedBox(
        height: ScreenSize.i.heigth,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleBar(
                  menu: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_drop_down_sharp,
                    ),
                  ),
                  nombreUsuario: "Nombre de Usuario",
                  puesto: "puesto"),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomSearchTab(
                  heigthFilterButtons: 40,
                  maxWidthBar: 950,
                  widthFilterButtons: 150,
                ),
              ),
              SizedBox(
                width: ScreenSize.i.width,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ScreenSize.i.width > 700
                          ? CuadroInfo(
                              heigth: ScreenSize.i.heigth * 0.7,
                              width: 250,
                            )
                          : const SizedBox(),
                    ),
                    CustomTable(
                      heigth: ScreenSize.i.heigth * 0.7,
                      width: ScreenSize.i.width <= 700
                          ? ScreenSize.i.width - 40
                          : ScreenSize.i.width - 300,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
