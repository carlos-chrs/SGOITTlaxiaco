import 'package:flutter/material.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

enum Alineacion { izquierda, derecha, centrado, justificado }

enum Medida { chico, mediano, grande }

class CampoDeDocumento {
  CampoDeDocumento(
      {required this.nombreDeCampo,
      required this.formato,
      required this.alineacion,
      required this.medida,
      this.textoEnriquesido = false,
      this.htmlController,
      required this.label,
      this.controller,
      this.lineas = 1,
      required this.key});
  String nombreDeCampo;
  String alineacion;
  QuillEditorController? htmlController;
  bool textoEnriquesido;
  TextEditingController? controller;
  String formato;
  String label;
  Medida medida;
  int lineas;
  Key key;
}
