import 'package:gigglify_fl/domain/entity/joke.dart';
import 'package:gigglify_fl/domain/repository/joke_repository.dart';

class GetSavedJokesUseCase {
  final JokeRepository _jokeRepository;

  GetSavedJokesUseCase(this._jokeRepository);

  List<Joke> invoke() {
    return _jokeRepository.getSavedJokes();
  }
}
