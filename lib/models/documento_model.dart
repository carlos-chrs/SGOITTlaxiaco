class DocumentModel {
  String? sId;
  String? lugar;
  String? fecha;
  String? serieOficio;
  String? asunto;
  String? destinatario;
  String? puesto;
  String? contexto;
  String? emisor;
  String? ocupacionEmisor;
  String? departamentoEmisor;
  String? rubricas;
  String? ccp;
  String? departamento;
  String? idUsuario;

  DocumentModel(
      {this.sId,
      this.lugar,
      this.fecha,
      this.serieOficio,
      this.asunto,
      this.destinatario,
      this.puesto,
      this.contexto,
      this.emisor,
      this.ocupacionEmisor,
      this.departamentoEmisor,
      this.rubricas,
      this.ccp,
      this.departamento,
      this.idUsuario});

  DocumentModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    lugar = json['lugar'];
    fecha = json['fecha'];
    serieOficio = json['serieOficio'];
    asunto = json['asunto'];
    destinatario = json['destinatario'];
    puesto = json['puesto'];
    contexto = json['contexto'];
    emisor = json['emisor'];
    ocupacionEmisor = json['ocupacionEmisor'];
    departamentoEmisor = json['departamentoEmisor'];
    rubricas = json['rubricas'];
    ccp = json['ccp'];
    departamento = json['departamento'];
    idUsuario = json['idUsuario'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['lugar'] = lugar;
    data['fecha'] = fecha;
    data['serieOficio'] = serieOficio;
    data['asunto'] = asunto;
    data['destinatario'] = destinatario;
    data['puesto'] = puesto;
    data['contexto'] = contexto;
    data['emisor'] = emisor;
    data['ocupacionEmisor'] = ocupacionEmisor;
    data['departamentoEmisor'] = departamentoEmisor;
    data['rubricas'] = rubricas;
    data['ccp'] = ccp;
    data['departamento'] = departamento;
    data['idUsuario'] = idUsuario;
    return data;
  }
}
