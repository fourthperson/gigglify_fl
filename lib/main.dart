import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gigglify_fl/app.dart';
import 'package:gigglify_fl/di/dependency_injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kDebugMode) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }

  await dotenv.load();

  await DependencyInjector.instance.prefsService.clearOnReinstall();

  runApp(GigglifyApp());
}
