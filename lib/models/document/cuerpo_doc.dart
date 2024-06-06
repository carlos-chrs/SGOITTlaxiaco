class DocumentBody {
  DocumentBody({
    required this.tittle,
    required this.campos,
    required this.departamentoEmisor,
    required this.letterhead,
    required this.logo,
    required this.idUsuario,
    required this.departamento,
  });

  final String? tittle;
  final List<Campo> campos;
  final String? departamentoEmisor;
  final String? letterhead;
  final String? logo;
  final String? idUsuario;
  final String? departamento;

  factory DocumentBody.fromJson(Map<String, dynamic> json) {
    return DocumentBody(
      tittle: json["tittle"],
      campos: json["campos"] == null
          ? []
          : List<Campo>.from(json["campos"]!.map((x) => Campo.fromJson(x))),
      departamentoEmisor: json["departamentoEmisor"],
      letterhead: json["letterhead"],
      logo: json["logo"],
      idUsuario: json["idUsuario"],
      departamento: json["departamento"],
    );
  }

  Map<String, dynamic> toJson() => {
        "tittle": tittle,
        "campos": campos.map((x) => x.toJson()).toList(),
        "departamentoEmisor": departamentoEmisor,
        "letterhead": letterhead,
        "logo": logo,
        "idUsuario": idUsuario,
        "departamento": departamento,
      };
}

class Campo {
  Campo({
    required this.name,
    required this.text,
    required this.font,
    required this.size,
    required this.alignment,
    required this.bold,
  });

  final String? name;
  final String? text;
  final String? font;
  final int? size;
  final String? alignment;
  final bool? bold;

  factory Campo.fromJson(Map<String, dynamic> json) {
    return Campo(
      name: json["name"],
      text: json["text"],
      font: json["font"],
      size: json["size"],
      alignment: json["alignment"],
      bold: json["bold"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "text": text,
        "font": font,
        "size": size,
        "alignment": alignment,
        "bold": bold,
      };
}
