// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'joke.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Joke _$JokeFromJson(Map<String, dynamic> json) {
  return _Joke.fromJson(json);
}

/// @nodoc
mixin _$Joke {
  bool get error => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String? get joke => throw _privateConstructorUsedError;
  String? get setup => throw _privateConstructorUsedError;
  String? get delivery => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  bool get safe => throw _privateConstructorUsedError;
  String get lang => throw _privateConstructorUsedError;

  /// Serializes this Joke to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Joke
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JokeCopyWith<Joke> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JokeCopyWith<$Res> {
  factory $JokeCopyWith(Joke value, $Res Function(Joke) then) =
      _$JokeCopyWithImpl<$Res, Joke>;
  @useResult
  $Res call(
      {bool error,
      String category,
      String type,
      String? joke,
      String? setup,
      String? delivery,
      int id,
      bool safe,
      String lang});
}

/// @nodoc
class _$JokeCopyWithImpl<$Res, $Val extends Joke>
    implements $JokeCopyWith<$Res> {
  _$JokeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Joke
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? category = null,
    Object? type = null,
    Object? joke = freezed,
    Object? setup = freezed,
    Object? delivery = freezed,
    Object? id = null,
    Object? safe = null,
    Object? lang = null,
  }) {
    return _then(_value.copyWith(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      joke: freezed == joke
          ? _value.joke
          : joke // ignore: cast_nullable_to_non_nullable
              as String?,
      setup: freezed == setup
          ? _value.setup
          : setup // ignore: cast_nullable_to_non_nullable
              as String?,
      delivery: freezed == delivery
          ? _value.delivery
          : delivery // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      safe: null == safe
          ? _value.safe
          : safe // ignore: cast_nullable_to_non_nullable
              as bool,
      lang: null == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JokeImplCopyWith<$Res> implements $JokeCopyWith<$Res> {
  factory _$$JokeImplCopyWith(
          _$JokeImpl value, $Res Function(_$JokeImpl) then) =
      __$$JokeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool error,
      String category,
      String type,
      String? joke,
      String? setup,
      String? delivery,
      int id,
      bool safe,
      String lang});
}

/// @nodoc
class __$$JokeImplCopyWithImpl<$Res>
    extends _$JokeCopyWithImpl<$Res, _$JokeImpl>
    implements _$$JokeImplCopyWith<$Res> {
  __$$JokeImplCopyWithImpl(_$JokeImpl _value, $Res Function(_$JokeImpl) _then)
      : super(_value, _then);

  /// Create a copy of Joke
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? category = null,
    Object? type = null,
    Object? joke = freezed,
    Object? setup = freezed,
    Object? delivery = freezed,
    Object? id = null,
    Object? safe = null,
    Object? lang = null,
  }) {
    return _then(_$JokeImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      joke: freezed == joke
          ? _value.joke
          : joke // ignore: cast_nullable_to_non_nullable
              as String?,
      setup: freezed == setup
          ? _value.setup
          : setup // ignore: cast_nullable_to_non_nullable
              as String?,
      delivery: freezed == delivery
          ? _value.delivery
          : delivery // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      safe: null == safe
          ? _value.safe
          : safe // ignore: cast_nullable_to_non_nullable
              as bool,
      lang: null == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JokeImpl implements _Joke {
  _$JokeImpl(
      {required this.error,
      required this.category,
      required this.type,
      required this.joke,
      required this.setup,
      required this.delivery,
      required this.id,
      required this.safe,
      required this.lang});

  factory _$JokeImpl.fromJson(Map<String, dynamic> json) =>
      _$$JokeImplFromJson(json);

  @override
  final bool error;
  @override
  final String category;
  @override
  final String type;
  @override
  final String? joke;
  @override
  final String? setup;
  @override
  final String? delivery;
  @override
  final int id;
  @override
  final bool safe;
  @override
  final String lang;

  @override
  String toString() {
    return 'Joke(error: $error, category: $category, type: $type, joke: $joke, setup: $setup, delivery: $delivery, id: $id, safe: $safe, lang: $lang)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JokeImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.joke, joke) || other.joke == joke) &&
            (identical(other.setup, setup) || other.setup == setup) &&
            (identical(other.delivery, delivery) ||
                other.delivery == delivery) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.safe, safe) || other.safe == safe) &&
            (identical(other.lang, lang) || other.lang == lang));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, error, category, type, joke,
      setup, delivery, id, safe, lang);

  /// Create a copy of Joke
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JokeImplCopyWith<_$JokeImpl> get copyWith =>
      __$$JokeImplCopyWithImpl<_$JokeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JokeImplToJson(
      this,
    );
  }
}

abstract class _Joke implements Joke {
  factory _Joke(
      {required final bool error,
      required final String category,
      required final String type,
      required final String? joke,
      required final String? setup,
      required final String? delivery,
      required final int id,
      required final bool safe,
      required final String lang}) = _$JokeImpl;

  factory _Joke.fromJson(Map<String, dynamic> json) = _$JokeImpl.fromJson;

  @override
  bool get error;
  @override
  String get category;
  @override
  String get type;
  @override
  String? get joke;
  @override
  String? get setup;
  @override
  String? get delivery;
  @override
  int get id;
  @override
  bool get safe;
  @override
  String get lang;

  /// Create a copy of Joke
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JokeImplCopyWith<_$JokeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
