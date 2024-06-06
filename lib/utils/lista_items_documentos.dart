enum Alineacion { izquierda, derecha, centrado, justificado }

class ItemDocument {
  final String nombre;
  final Alineacion alineacion;
  final int lineasDeTexto;

  ItemDocument({required this.nombre, required this.alineacion, required this.lineasDeTexto});
}
