import 'dart:typed_data';

import 'package:dio/dio.dart';

Future<Response> uploadFont(String fileName, Uint8List fileBytes) async {
  final formData = FormData.fromMap({
    'file': MultipartFile.fromBytes(fileBytes, filename: fileName),
  });

  final response = await Dio().post(
    "https://api.example.com/uploadFile7",
    data: formData,
  );
  return response;
}
