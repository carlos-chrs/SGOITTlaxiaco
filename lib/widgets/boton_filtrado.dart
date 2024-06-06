import 'package:flutter/material.dart';

class FilterButtom extends StatelessWidget {
  const FilterButtom({
    super.key,
    required this.hint,
    required this.action,
    required this.width,
    required this.heigth,
    required this.icon,
  });

  final String hint;
  final VoidCallback action;
  final double width;
  final double heigth;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heigth,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
              color: Colors.black38,
              offset: Offset(1, 2),
              blurRadius: 5,
              spreadRadius: 0),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: icon,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                decoration: InputDecoration.collapsed(
                  hintText: hint,
                  hintStyle:
                      const TextStyle(color: Colors.black54, fontSize: 18),
                ),
                onChanged: (value) {
                  if (value.length % 3 == 0) {
                    action();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
