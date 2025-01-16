import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:gigglify_fl/data/api/joke.dart';
import 'package:gigglify_fl/data/db/schemas.dart';
import 'package:gigglify_fl/repo/category_repo.dart';
import 'package:gigglify_fl/services/db_service.dart';
import 'package:gigglify_fl/services/rest_service.dart';

class JokeRepo {
  final RestService _restService;
  final DbService _dbService;
  final CategoryRepo _categoryRepo;

  const JokeRepo(this._dbService, this._restService, this._categoryRepo);

  Future<Joke?> getJoke() async {
    try {
      String path = await _categoryRepo.getCategoriesPath();
      String? json = await _restService.get(path: path);
      if (json != null) {
        Map<String, dynamic> decoded = jsonDecode(json);
        Joke joke = Joke.fromJson(decoded);
        if (!joke.error) {
          _saveJoke(joke);
          return joke;
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  void _saveJoke(Joke joke) {
    _dbService.saveJoke(joke);
  }

  List<SavedJoke> getSavedJokes() {
    return _dbService.savedJokes();
  }
}
