import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigglify_fl/blocs/history/history_bloc.dart';
import 'package:gigglify_fl/blocs/joke/joke_bloc.dart';
import 'package:gigglify_fl/di/dependency_injector.dart';
import 'package:gigglify_fl/l10n/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gigglify_fl/navigation/route_handler.dart';

class GigglifyApp extends StatefulWidget {
  final AppRouter appRouter = AppRouter();

  GigglifyApp({super.key});

  @override
  State<GigglifyApp> createState() => _GigglifyAppState();
}

class _GigglifyAppState extends State<GigglifyApp> {
  @override
  Widget build(BuildContext context) {
    return _GigglifyBlocProvider(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: widget.appRouter.config(),
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<JokeBloc>(
          create: (context) => JokeBloc(DependencyInjector.instance.jokeRepo),
        ),
        BlocProvider<HistoryBloc>(
          create: (context) =>
              HistoryBloc(DependencyInjector.instance.jokeRepo),
        ),
      ],
      child: child,
    );
  }
}
