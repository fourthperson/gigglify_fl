import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RestService {
  final Dio _dio;

  const RestService(this._dio);

  Future<String?> get({required String path}) async {
    try {
      Response response = await _dio.get(path);
      if (response.statusCode == 200) {
        return response.data.toString();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
