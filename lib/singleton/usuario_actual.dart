class UserData {
  String nombre = 'sin nombre';
  String departamento = 'departamento';
  String rol = 'rol';
  String puesto = 'puesto';

  // Constructor privado para evitar instancias directas
  UserData._privateConstructor();

  // Instancia única del singleton
  static final UserData _instance = UserData._privateConstructor();

  // Método para obtener la instancia única
  factory UserData() {
    return _instance;
  }
}
