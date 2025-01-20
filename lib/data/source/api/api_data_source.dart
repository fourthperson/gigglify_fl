import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:gigglify_fl/data/entity/api/joke_response.dart';
import 'package:gigglify_fl/data/source/services/services_export.dart';
import 'package:gigglify_fl/domain/repository/choice_repository.dart';

abstract class ApiDataSource {
  Future<JokeResponseModel?> getJoke();
}

class ApiDataSourceImpl extends ApiDataSource {
  final RestService _restService;
  final ChoiceRepository _choiceRepository;

  ApiDataSourceImpl(this._restService, this._choiceRepository);

  @override
  Future<JokeResponseModel?> getJoke() async {
    try {
      String path = await _choiceRepository.getPath();
      String? json = await _restService.get(path: path);
      if (json == null) return null;
      JokeResponseModel model = JokeResponseModel.fromJson(
        jsonDecode(json),
      );
      if (!model.error) {
        return model;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
