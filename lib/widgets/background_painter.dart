import 'package:flutter/material.dart';

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double ancho = size.width;
    double alto = size.height;

    final paint = Paint()
      ..color = const Color.fromARGB(
          255, 12, 14, 81) // Color de las figuras geométricas
      ..style = PaintingStyle.fill;
    final path = Path()
      ..moveTo(0, alto)
      ..lineTo(0, alto / 2)
      ..lineTo(ancho / 3, (alto / 3) * 2)
      ..lineTo((ancho / 3) * 2, alto / 3)
      ..lineTo(ancho, alto / 2)
      ..lineTo(ancho, alto)
      ..lineTo(0, alto);

    // ..quadraticBezierTo(200, 0, 150, 100);
    canvas.drawPath(path, paint);

    // Dibujar un rectángulo
    // canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
    // canvas.drawColor(Colors.red, BlendMode.color);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
