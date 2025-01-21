import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gigglify_fl/main.dart';
import 'package:gigglify_fl/presentation/blocs/joke/joke_bloc.dart';
import 'package:gigglify_fl/presentation/l10n/generated/l10n.dart';
import 'package:gigglify_fl/presentation/navigation/route_handler.dart';

class GigglifyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  GigglifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return _GigglifyBlocProvider(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _appRouter.config(),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
        ],
      ),
    );
  }
}

class _GigglifyBlocProvider extends StatelessWidget {
  final Widget child;

  const _GigglifyBlocProvider({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<JokeBloc>(),
      child: child,
    );
  }
}
