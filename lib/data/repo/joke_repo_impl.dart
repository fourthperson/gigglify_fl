import 'package:flutter/foundation.dart';
import 'package:gigglify_fl/data/entity/api/joke_response.dart';
import 'package:gigglify_fl/data/entity/db/schemas.dart';
import 'package:gigglify_fl/data/source/api/api_data_source.dart';
import 'package:gigglify_fl/data/source/db/db_data_source.dart';
import 'package:gigglify_fl/domain/entity/joke.dart';
import 'package:gigglify_fl/domain/repository/joke_repository.dart';

class JokeRepositoryImpl extends JokeRepository {
  final ApiDataSource _apiDataSource;
  final DatabaseDataSource _databaseDataSource;

  JokeRepositoryImpl(this._apiDataSource, this._databaseDataSource);

  @override
  Future<Joke?> getJoke() async {
    JokeResponseModel? apiModel = await _apiDataSource.getJoke();
    if (apiModel != null) {
      return Joke(
        time: DateTime.now().microsecondsSinceEpoch,
        content: _concatJokeParts(apiModel),
        category: apiModel.category,
      );
    }
    return null;
  }

  String _concatJokeParts(JokeResponseModel model) {
    return model.type == 'twopart'
        ? '${model.setup ?? ''}\n\n${model.delivery ?? ''}'
        : model.joke ?? '';
  }

  @override
  void saveJoke(Joke joke) {
    _databaseDataSource.saveJoke(joke);
  }

  @override
  List<Joke> getSavedJokes() {
    List<Joke> jokes = [];
    try {
      List<SavedJoke> saved = _databaseDataSource.getSavedJokes();
      for (SavedJoke s in saved) {
        jokes.add(
          Joke(
            time: s.time,
            content: s.joke,
            category: s.category,
          ),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return jokes;
  }
}
