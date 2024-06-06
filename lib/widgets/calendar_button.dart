import 'package:flutter/material.dart';

class CalenarButton extends StatelessWidget {
  const CalenarButton({
    Key? key,
    required this.action,
    required this.width,
    required this.heigth,
    required this.text,
  }) : super(key: key);

  final VoidCallback action;
  final double width;
  final double heigth;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        // alignment: Alignment.center,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Icon(Icons.date_range_rounded),
            ),
            text != ""
                ? Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          text,
                          style: const TextStyle(
                              color: Colors.black54, fontSize: 18),
                        )),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}




// var results = await showCalendarDatePicker2Dialog(
//   context: context,
//   config: CalendarDatePicker2WithActionButtonsConfig(),
//   dialogSize: const Size(325, 400),
//   value: _dates,
//   borderRadius: BorderRadius.circular(15),
// );