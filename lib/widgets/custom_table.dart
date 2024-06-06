import 'package:flutter/material.dart';
import 'package:web_app_tec/utils/screen_size.dart';

class CustomTable extends StatelessWidget {
  const CustomTable({Key? key, required this.heigth, required this.width})
      : super(key: key);
  final double heigth;
  final double width;
  @override
  Widget build(BuildContext context) {
    ScreenSize.i.upadate(context);
    return Container(
      height: heigth,
      width: width,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black26,
          offset: Offset(3, 5),
          blurRadius: 3,
        ),
        BoxShadow(
          color: Colors.black26,
          offset: Offset(-2, -2),
          blurRadius: 2,
        ),
      ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 40,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 10,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.circular(6)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("item $index"),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
