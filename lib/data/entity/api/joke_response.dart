import 'package:freezed_annotation/freezed_annotation.dart';

part 'joke_response.freezed.dart';

part 'joke_response.g.dart';

@freezed
class JokeResponseModel with _$JokeResponseModel {
  factory JokeResponseModel({
    required bool error,
    required String category,
    required String type,
    required String? joke,
    required String? setup,
    required String? delivery,
    required int id,
    required bool safe,
    required String lang,
  }) = _JokeResponseModel;

  factory JokeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$JokeResponseModelFromJson(json);
}
