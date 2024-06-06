import 'package:flutter/material.dart';
import 'package:web_app_tec/utils/screen_size.dart';

class Separador extends StatelessWidget {
  const Separador({Key? key, required this.nombre, required this.boton})
      : super(key: key);
  final String nombre;
  final Widget boton;

  @override
  Widget build(BuildContext context) {
    ScreenSize.i.upadate(context);
    return Container(
      alignment: Alignment.centerRight,
      width: ScreenSize.i.width,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(nombre),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: boton,
          ),
        ],
      ),
    );
  }
}



// TextButton(
//               onPressed: () {},
//               child: Text("ver mas"),
//             ),