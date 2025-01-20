// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schemas.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class SavedJoke extends _SavedJoke
    with RealmEntity, RealmObjectBase, RealmObject {
  SavedJoke(
    int time,
    String joke,
    String category,
  ) {
    RealmObjectBase.set(this, 'time', time);
    RealmObjectBase.set(this, 'joke', joke);
    RealmObjectBase.set(this, 'category', category);
  }

  SavedJoke._();

  @override
  int get time => RealmObjectBase.get<int>(this, 'time') as int;
  @override
  set time(int value) => RealmObjectBase.set(this, 'time', value);

  @override
  String get joke => RealmObjectBase.get<String>(this, 'joke') as String;
  @override
  set joke(String value) => RealmObjectBase.set(this, 'joke', value);

  @override
  String get category =>
      RealmObjectBase.get<String>(this, 'category') as String;
  @override
  set category(String value) => RealmObjectBase.set(this, 'category', value);

  @override
  Stream<RealmObjectChanges<SavedJoke>> get changes =>
      RealmObjectBase.getChanges<SavedJoke>(this);

  @override
  Stream<RealmObjectChanges<SavedJoke>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<SavedJoke>(this, keyPaths);

  @override
  SavedJoke freeze() => RealmObjectBase.freezeObject<SavedJoke>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'time': time.toEJson(),
      'joke': joke.toEJson(),
      'category': category.toEJson(),
    };
  }

  static EJsonValue _toEJson(SavedJoke value) => value.toEJson();
  static SavedJoke _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'time': EJsonValue time,
        'joke': EJsonValue joke,
        'category': EJsonValue category,
      } =>
        SavedJoke(
          fromEJson(time),
          fromEJson(joke),
          fromEJson(category),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(SavedJoke._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, SavedJoke, 'SavedJoke', [
      SchemaProperty('time', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('joke', RealmPropertyType.string),
      SchemaProperty('category', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
