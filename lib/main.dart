import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:gigglify_fl/app.dart';
import 'package:gigglify_fl/data/entity/db/schemas.dart';
import 'package:gigglify_fl/data/repo/choice_repo_impl.dart';
import 'package:gigglify_fl/data/repo/joke_repo_impl.dart';
import 'package:gigglify_fl/data/source/api/api_data_source.dart';
import 'package:gigglify_fl/data/source/db/db_data_source.dart';
import 'package:gigglify_fl/data/source/services/services_export.dart';
import 'package:gigglify_fl/domain/repository/choice_repository.dart';
import 'package:gigglify_fl/domain/repository/joke_repository.dart';
import 'package:gigglify_fl/domain/use_case/get_choice_use_case.dart';
import 'package:gigglify_fl/domain/use_case/get_joke_use_case.dart';
import 'package:gigglify_fl/domain/use_case/get_saved_jokes_use_case.dart';
import 'package:gigglify_fl/domain/use_case/save_choice_use_case.dart';
import 'package:gigglify_fl/domain/use_case/save_joke_use_case.dart';
import 'package:gigglify_fl/presentation/blocs/blocs_export.dart';
import 'package:realm/realm.dart';

part 'di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kDebugMode) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }

  await dotenv.load();

  initDependencies();

  await locator<PrefsService>().clearOnReinstall();

  runApp(GigglifyApp());
}
