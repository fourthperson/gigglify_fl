import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gigglify_fl/config/constants.dart';
import 'package:gigglify_fl/data/db/schemas.dart';
import 'package:gigglify_fl/repo/joke_repo.dart';
import 'package:realm/realm.dart';

class DependencyInjector {
  static DependencyInjector? _instance;

  static DependencyInjector get instance {
    _instance ??= DependencyInjector._init();
    return _instance!;
  }

  late final Realm realm;
  late final Dio dio;
  late final JokeRepo jokeRepo;

  DependencyInjector._init() {
    realm = Realm(
      Configuration.local(
        [SavedJoke.schema],
      ),
    );
    dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(milliseconds: apiTimeoutDuration),
        receiveTimeout: const Duration(milliseconds: apiTimeoutDuration),
        receiveDataWhenStatusError: false,
        validateStatus: (status) => true,
        contentType: 'application/json; charset=UTF-8',
        baseUrl: dotenv.get('API_BASE_URL'),
        responseType: ResponseType.plain,
      ),
    );
    jokeRepo = JokeRepo(realm, dio);
  }
}
