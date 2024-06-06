import 'package:flutter/widgets.dart';

class ScreenSize {
  double width = 0;
  double heigth = 0;
  BuildContext? context;
  upadate(BuildContext context) {
    var size = MediaQuery.of(context).size;
    width = size.width;
    heigth = size.height;
    this.context = context;
  }

  double cmToPx(double cm) {
    // Obtén la densidad de píxeles del dispositivo
    double dpi = MediaQuery.of(context!).devicePixelRatio;
    // Convierte centímetros a pulgadas (1 cm = 0.393701 pulgadas)
    double cmInInches = cm * 0.393701;
    // Convierte pulgadas a píxeles
    double pixels = cmInInches * dpi * 160;
    return pixels;
  }

  ScreenSize._();

  static final i = ScreenSize._();
}
