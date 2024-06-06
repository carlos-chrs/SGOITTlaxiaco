import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_app_tec/utils/screen_size.dart';

class TitleBar extends StatelessWidget {
  const TitleBar(
      {Key? key,
      required this.menu,
      required this.nombreUsuario,
      required this.puesto})
      : super(key: key);
  final Widget menu;
  final String nombreUsuario;
  final String puesto;
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
            child: Container(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Icon(Icons.home_outlined), Text("")],
                ),
                onPressed: () {
                  context.go("/");
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ScreenSize.i.width > 700
                    ? Text(
                        puesto,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w100),
                      )
                    : const SizedBox(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ScreenSize.i.width > 700
                    ? const Text(
                        "-",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w100),
                      )
                    : const SizedBox(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  nombreUsuario,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w100),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: menu),
            ],
          ),
        ],
      ),
    );
  }
}
