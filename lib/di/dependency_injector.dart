import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gigglify_fl/config/constants.dart';
import 'package:gigglify_fl/data/db/schemas.dart';
import 'package:gigglify_fl/repo/category_repo.dart';
import 'package:gigglify_fl/repo/joke_repo.dart';
import 'package:gigglify_fl/services/db_service.dart';
import 'package:gigglify_fl/services/prefs_service.dart';
import 'package:gigglify_fl/services/rest_service.dart';
import 'package:realm/realm.dart';

class DependencyInjector {
  static DependencyInjector? _instance;

  static DependencyInjector get instance {
    _instance ??= DependencyInjector._init();
    return _instance!;
  }

  late final Realm _realm;
  late final Dio _dio;
  late final FlutterSecureStorage _secureStorage;

  late final RestService restService;
  late final DbService dbService;
  late final PrefsService prefsService;

  late final JokeRepo jokeRepo;
  late final CategoryRepo categoryRepo;

  DependencyInjector._init() {
    _secureStorage = const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    );

    _realm = Realm(
      Configuration.local(
        [SavedJoke.schema],
      ),
    );

    _dio = Dio(
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
    _dio.interceptors.clear();
    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(responseBody: true, requestBody: true),
      );
    }

    prefsService = PrefsService(_secureStorage);
    restService = RestService(_dio);
    dbService = DbService(_realm);

    categoryRepo = CategoryRepo(prefsService);
    jokeRepo = JokeRepo(dbService, restService, categoryRepo);
  }
}
