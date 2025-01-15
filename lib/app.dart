import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigglify_fl/blocs/joke/joke_bloc.dart';
import 'package:gigglify_fl/l10n/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gigglify_fl/navigation/route_handler.dart';
import 'package:gigglify_fl/repo/joke_repo.dart';

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
          create: (context) => JokeBloc(JokeRepo()),
        ),
      ],
      child: child,
    );
  }
}
