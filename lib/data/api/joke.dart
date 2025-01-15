import 'package:freezed_annotation/freezed_annotation.dart';

part 'joke.freezed.dart';

part 'joke.g.dart';

@freezed
class Joke with _$Joke {
  factory Joke({
    required bool error,
    required String category,
    required String type,
    required String? joke,
    required String? setup,
    required String? delivery,
    required int id,
    required bool safe,
    required String lang,
  }) = _Joke;

  factory Joke.fromJson(Map<String, dynamic> json) => _$JokeFromJson(json);
}
