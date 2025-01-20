import 'package:realm/realm.dart';

part 'schemas.realm.dart';

@RealmModel()
class _SavedJoke {
  @PrimaryKey()
  late int time;
  late String joke;
  late String category;
}
