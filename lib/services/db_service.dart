import 'package:gigglify_fl/data/api/joke.dart';
import 'package:gigglify_fl/data/db/schemas.dart';
import 'package:realm/realm.dart';

class DbService {
  final Realm _realm;

  const DbService(this._realm);

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
