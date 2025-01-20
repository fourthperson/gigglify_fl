import 'package:gigglify_fl/domain/entity/joke.dart';
import 'package:gigglify_fl/domain/repository/joke_repository.dart';

class GetJokeUseCase {
  final JokeRepository _jokeRepository;

  GetJokeUseCase(this._jokeRepository);

  Future<Joke?> invoke() {
    return _jokeRepository.getJoke();
  }
}
