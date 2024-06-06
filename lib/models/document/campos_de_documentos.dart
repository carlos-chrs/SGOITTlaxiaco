class FieldDocument {
  String name;
  String text;
  String font;
  String size;
  String alignment;
  bool bold;
  String key;

  FieldDocument(
      {required this.name,
      required this.text,
      required this.font,
      required this.size,
      required this.alignment,
      required this.bold,
      required this.key});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['name'] = name;
    data['text'] = text;
    data['font'] = font;
    data['size'] = size;
    data['alignment'] = alignment;
    data['bold'] = bold;
    data['key'] = key;

    return data;
  }
}
