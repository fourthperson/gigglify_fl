import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:gigglify_fl/data/api/joke.dart';
import 'package:gigglify_fl/data/db/schemas.dart';
import 'package:realm/realm.dart';

class JokeRepo {
  final Realm _realm;
  final Dio _dio;

  JokeRepo(this._realm, this._dio);

  Future<Joke?> getJoke() async {
    try {
      Response response = await _dio.get('Any');
      if (response.statusCode == 200) {
        String jsonString = response.data.toString();
        Map<String, Object?> json = jsonDecode(jsonString);
        Joke joke = Joke.fromJson(json);
        if (!joke.error) {
          saveJoke(joke);
          return joke;
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  void saveJoke(Joke joke) {
    String s = joke.type == 'twopart'
        ? '${joke.setup}\n\n${joke.delivery}'
        : joke.joke ?? '';

    _realm.write<SavedJoke>(() {
      return _realm.add(
        SavedJoke(
          DateTime.now().millisecondsSinceEpoch,
          s,
          joke.category,
        ),
      );
    });
  }

  List<SavedJoke> savedJokes() {
    return _realm.query<SavedJoke>('TRUEPREDICATE SORT(time DESC)').toList();
  }
}
