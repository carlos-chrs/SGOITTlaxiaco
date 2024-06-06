import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    Key? key,
    required this.action,
    required this.width,
    required this.heigth,
    required this.controller,
  }) : super(key: key);
  final VoidCallback? action;
  final double width;
  final double heigth;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heigth,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              offset: Offset(5, 2),
              blurRadius: 5,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: SizedBox(
              width: width - 80,
              child: TextFormField(
                controller: controller,
                onEditingComplete: action,
                decoration: const InputDecoration.collapsed(
                  hintText: "Buscar...",
                  hintStyle: TextStyle(color: Colors.black54, fontSize: 18),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child:
                IconButton(onPressed: action, icon: const Icon(Icons.search)),
          ),
        ],
      ),
    );
  }
}
