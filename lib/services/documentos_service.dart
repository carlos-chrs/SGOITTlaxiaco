import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_app_tec/api/endpoints.dart';
import 'package:web_app_tec/models/document/cuerpo_doc.dart';
import 'package:web_app_tec/models/document/cuerpo_documento.dart';
import 'package:web_app_tec/models/documento_model.dart';

class DocumentService {
  static const String _baseUrl = urlBase;
  static const String _route = '/document';

  static Future<List<DocumentModel>> getAllDocuments() async {
    final url = Uri.parse('$_baseUrl$_route/get');
    final response = await http.get(url);

    // print("response: $response");
    if (response.statusCode == 200) {
      // Si la solicitud es exitosa, convierte la respuesta JSON en una lista de DocumentModel
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((e) => DocumentModel.fromJson(e)).toList();
    } else {
      print(response.body);
      // Si la solicitud falla, la
      //prinza una excepción o maneja el error de alguna manera
      throw Exception('error al cargar documentos');
    }
  }

  static Future<List<int>?> save(String token, DocumentBody doc) async {
    final url = Uri.parse('$_baseUrl$_route/save');
    final response = await http.post(
      headers: {
        'Content-Type': 'application/json',
        'authorization': "Bearer $token"
      },
      url,
      body: jsonEncode(doc.toJson()),
    );
    // print("response: $response");
    if (response.statusCode == 200) {
      // Si la solicitud es exitosa, convierte la respuesta JSON en una lista de DocumentModel
      final List<int> jsonList = response.bodyBytes.toList();
      return jsonList;
    } else {
      print(response.body);
      // Si la solicitud falla, lanza una excepción o maneja el error de alguna manera
      print('error al crear documentos');
      return null;
    }
  }
}
