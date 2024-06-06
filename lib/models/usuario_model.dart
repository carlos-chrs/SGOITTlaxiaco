class UsuarioLocal {
  String? token;
  String? id;
  String? name;
  int? permissionLevel;

  UsuarioLocal({this.token, this.id, this.name, this.permissionLevel});

  UsuarioLocal.fromJson(Map<String, dynamic> json) {
    token = json['accessToken'];
    id = json['id'];
    name = json['name'];
    permissionLevel = json['permissionLevel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = token;
    data['id'] = id;
    data['name'] = name;
    data['permissionLevel'] = permissionLevel;
    return data;
  }
}
