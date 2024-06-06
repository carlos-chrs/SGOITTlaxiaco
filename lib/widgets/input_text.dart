import 'package:flutter/material.dart';
import 'package:web_app_tec/utils/screen_size.dart';

class InputText extends StatelessWidget {
  final String hintText;
  final TextEditingController? textController;
  const InputText(
      {Key? key, required this.hintText, required this.textController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.i.upadate(context);
    return Container(
      width: ScreenSize.i.width < 500 ? 300 : 400,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(5, 5),
            blurRadius: 0.5,
          ),
          BoxShadow(
            color: Colors.black12,
            offset: Offset(-2, -2),
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: textController,
            autofocus: true,
            decoration: InputDecoration.collapsed(
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.black54, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
