import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    Key? key,
    required this.action,
    required this.text,
  }) : super(key: key);

  final VoidCallback action;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
              color: Colors.black38,
              offset: Offset(0, 3),
              blurRadius: 4,
              spreadRadius: 4)
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: MaterialButton(
        color: const Color.fromARGB(255, 21, 48, 93),
        onPressed: action,
        child: SizedBox(
          height: 100,
          width: 150,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
