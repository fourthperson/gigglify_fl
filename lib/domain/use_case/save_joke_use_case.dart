import 'package:gigglify_fl/domain/entity/joke.dart';
import 'package:gigglify_fl/domain/repository/joke_repository.dart';

class SaveJokeUseCase {
  final JokeRepository _jokeRepository;

  SaveJokeUseCase(this._jokeRepository);

  void invoke(Joke joke) {
    _jokeRepository.saveJoke(joke);
  }
}
