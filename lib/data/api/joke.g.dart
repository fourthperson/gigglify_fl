// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joke.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JokeImpl _$$JokeImplFromJson(Map<String, dynamic> json) => _$JokeImpl(
      error: json['error'] as bool,
      category: json['category'] as String,
      type: json['type'] as String,
      joke: json['joke'] as String?,
      setup: json['setup'] as String?,
      delivery: json['delivery'] as String?,
      id: (json['id'] as num).toInt(),
      safe: json['safe'] as bool,
      lang: json['lang'] as String,
    );

Map<String, dynamic> _$$JokeImplToJson(_$JokeImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
      'category': instance.category,
      'type': instance.type,
      'joke': instance.joke,
      'setup': instance.setup,
      'delivery': instance.delivery,
      'id': instance.id,
      'safe': instance.safe,
      'lang': instance.lang,
    };
