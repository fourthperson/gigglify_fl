import 'package:gigglify_fl/data/entity/db/schemas.dart';
import 'package:gigglify_fl/domain/entity/joke.dart';
import 'package:realm/realm.dart';

abstract class DatabaseDataSource {
  void saveJoke(Joke joke);

  List<SavedJoke> getSavedJokes();
}

class DatabaseDataSourceImpl extends DatabaseDataSource {
  final Realm _realm;

  DatabaseDataSourceImpl(this._realm);

  @override
  List<SavedJoke> getSavedJokes() {
    return _realm
        .query<SavedJoke>(
          'TRUEPREDICATE SORT(time DESC)',
        )
        .toList();
  }

  @override
  void saveJoke(Joke joke) {
    _realm.write<SavedJoke>(() {
      return _realm.add(
        SavedJoke(
          joke.time,
          joke.content,
          joke.category,
        ),
      );
    });
  }
}
