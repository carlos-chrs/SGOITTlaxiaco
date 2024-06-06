import 'dart:math';

import 'package:flutter/material.dart';

class MiniaturaDocumento extends StatelessWidget {
  MiniaturaDocumento({
    Key? key,
    required this.asunto,
    required this.departameto,
    required this.fecha,
  }) : super(key: key);
  String asunto;
  String departameto;
  String fecha;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 125,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(5, 5),
            blurRadius: 5,
          ),
          BoxShadow(
            color: Colors.black26,
            offset: Offset(-2, -2),
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(asunto),
          Container(
            width: double.infinity,
            height: 60,
            color: Color.fromRGBO(Random().nextInt(150), Random().nextInt(150),
                Random().nextInt(150), 1),
            child: Center(
                child: Text(
              departameto,
              style: const TextStyle(color: Colors.white),
            )),
          ),
          Text(fecha),
        ],
      ),
    );
  }
}
