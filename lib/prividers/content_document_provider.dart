import 'package:flutter/material.dart';
import 'package:web_app_tec/models/campo_documento_model.dart';

class ContenidoDocumentoProvider with ChangeNotifier {
  List<CampoDeDocumento> _items = [
    CampoDeDocumento(
      nombreDeCampo: 'Fecha',
      formato: "formato",
      alineacion: "rigth",
      controller: TextEditingController(),
      medida: Medida.chico,
      label: "23/01/2024",
      key: const Key('Fecha'),
    ),
    CampoDeDocumento(
      nombreDeCampo: 'Asunto',
      formato: "formato",
      alineacion: "rigth",
      controller: TextEditingController(),
      key: const Key('Asunto'),
      label: "asunto del documento",
      medida: Medida.mediano,
    ),
    CampoDeDocumento(
      nombreDeCampo: 'Dirigido a',
      formato: "formato",
      alineacion: "rigth",
      controller: TextEditingController(),
      label: " dirigido a",
      key: const Key('Dirigido a'),
      medida: Medida.mediano,
    ),
    CampoDeDocumento(
      nombreDeCampo: 'Puesto',
      formato: "formato",
      alineacion: "rigth",
      controller: TextEditingController(),
      label: "puesto",
      key: const Key('Puesto'),
      medida: Medida.mediano,
    ),
    // CampoDeDocumento(
    //     nombreDeCampo: 'Cuerpo',
    //     formato: "formato",
    //     textoEnriquesido: true,
    //     htmlController: QuillEditorController(),
    //     alineacion: Alineacion.derecha,
    //     label: "escriba el cuerpo del documento",
    //     key: const Key('Cuerpo'),
    //     lineas: 8,
    //     medida: Medida.grande),
  ];
  get items => _items;

  void repalceList(List<CampoDeDocumento> value) {
    _items = value;
    notifyListeners();
  }
}
