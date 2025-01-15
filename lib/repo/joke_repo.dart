import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gigglify_fl/data/api/joke.dart';

class JokeRepo {
  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(milliseconds: 15000),
      receiveTimeout: const Duration(milliseconds: 15000),
      receiveDataWhenStatusError: false,
      validateStatus: (status) => true,
      contentType: 'application/json; charset=UTF-8',
      baseUrl: dotenv.get('API_BASE_URL'),
      responseType: ResponseType.plain,
    ),
  );

  Future<Joke?> getJoke() async {
    // try {
    Response response = await _dio.get('Any');
    debugPrint(response.data.toString());
    if (response.statusCode == 200) {
      String jsonString = response.data.toString();
      Map<String, Object?> json = jsonDecode(jsonString);
      Joke joke = Joke.fromJson(json);
      if (!joke.error) {
        return joke;
      }
    }
    // } catch (e) {
    //   debugPrint(e.toString());
    // }
    return null;
  }
}
