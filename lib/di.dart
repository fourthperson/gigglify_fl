part of 'main.dart';

final locator = GetIt.instance;

void initDependencies() {
  // list of api paths from .env
  final List<String> apiPaths = dotenv.get('API_PATHS').split(' ');
  locator.registerSingleton(apiPaths);
  // network, preferences and database instances
  final Dio dio = locator.registerSingleton(_dio());
  final Realm realm = locator.registerSingleton(_realm());
  final FlutterSecureStorage secureStorage = locator.registerSingleton(
    const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    ),
  );

  // services
  final RestService restService = locator.registerSingleton(RestService(dio));
  final PrefsService prefsService = locator.registerSingleton(
    PrefsService(secureStorage),
  );

  // choice repository
  final ChoiceRepository choiceRepository = locator.registerSingleton(
    ChoiceRepositoryImpl(apiPaths, prefsService),
  );

  // data sources
  final ApiDataSource apiDataSource = locator.registerSingleton(
    ApiDataSourceImpl(
      restService,
      choiceRepository,
    ),
  );
  final DatabaseDataSource databaseDataSource = locator.registerSingleton(
    DatabaseDataSourceImpl(realm),
  );

  // joke repository
  final JokeRepository jokeRepository = JokeRepositoryImpl(
    apiDataSource,
    databaseDataSource,
  );

  // use-cases
  final GetJokeUseCase getJokeUseCase =
      locator.registerSingleton(GetJokeUseCase(jokeRepository));
  final SaveJokeUseCase saveJokeUseCase =
      locator.registerSingleton(SaveJokeUseCase(jokeRepository));
  final GetSavedJokesUseCase getSavedJokesUseCase =
      locator.registerSingleton(GetSavedJokesUseCase(jokeRepository));
  final GetChoiceUseCase getChoiceUseCase =
      locator.registerSingleton(GetChoiceUseCase(choiceRepository));
  final SaveChoiceUseCase saveChoiceUseCase =
      locator.registerSingleton(SaveChoiceUseCase(choiceRepository));

  // blocs
  locator.registerFactory(() => JokeBloc(getJokeUseCase, saveJokeUseCase));
  locator.registerFactory(() => HistoryBloc(getSavedJokesUseCase));
  locator.registerFactory(
    () => PreferenceBloc(getChoiceUseCase, saveChoiceUseCase),
  );
}

Dio _dio() {
  Dio dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(milliseconds: 15000),
      receiveTimeout: const Duration(milliseconds: 15000),
      receiveDataWhenStatusError: false,
      validateStatus: (status) => true,
      contentType: 'application/json; charset=UTF-8',
      baseUrl: dotenv.get('API_BASE_URL'),
      responseType: ResponseType.plain,
    ),
  );
  dio.interceptors.clear();
  if (kDebugMode) {
    dio.interceptors.add(
      LogInterceptor(responseBody: true, requestBody: true),
    );
  }
  return dio;
}

Realm _realm() {
  return Realm(
    Configuration.local(
      [SavedJoke.schema],
    ),
  );
}
