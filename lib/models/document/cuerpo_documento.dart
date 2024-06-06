import 'package:web_app_tec/models/document/campos_de_documentos.dart';

class CuerpoDocumento {
  String tittle;
  String departamentoEmisor;
  List<FieldDocument>? campos;
  String departamento;
  String idUsuario;

  CuerpoDocumento({
    required this.tittle,
    required this.campos,
    required this.departamentoEmisor,
    required this.departamento,
    required this.idUsuario,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['tittle'] = tittle;
    data['departamentoEmisor'] = departamentoEmisor;
    if (campos != null) {
      data['campos'] = campos!.map((v) => v.toJson()).toList();
    }
    data['departamento'] = departamento;
    data['idUsuario'] = idUsuario;

    return data;
  }
}
