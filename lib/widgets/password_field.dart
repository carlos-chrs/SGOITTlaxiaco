import 'package:flutter/material.dart';
import 'package:web_app_tec/utils/screen_size.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final IconData visibilityIcon;
  final IconData visibilityOffIcon;
  final VoidCallback onEnter;

  const PasswordField({
    Key? key,
    required this.onEnter,
    required this.controller,
    required this.labelText,
    this.obscureText = true,
    this.visibilityIcon = Icons.visibility,
    this.visibilityOffIcon = Icons.visibility_off,
  }) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;
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
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextFormField(
            onEditingComplete: widget.onEnter,
            controller: widget.controller,
            obscureText: _obscureText,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.labelText,
              hintStyle: const TextStyle(color: Colors.black54, fontSize: 18),
              suffixIcon: IconButton(
                icon: Icon(_obscureText
                    ? widget.visibilityIcon
                    : widget.visibilityOffIcon),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
