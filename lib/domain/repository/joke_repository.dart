import 'package:gigglify_fl/domain/entity/joke.dart';

abstract class JokeRepository {
  Future<Joke?> getJoke();

  void saveJoke(Joke joke);

  List<Joke> getSavedJokes();
}
