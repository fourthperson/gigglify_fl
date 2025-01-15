import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gigglify_fl/config/constants.dart';
import 'package:gigglify_fl/config/theme.dart';
import 'package:gigglify_fl/l10n/generated/l10n.dart';
import 'package:gigglify_fl/navigation/route_handler.gr.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(milliseconds: splashDuration),
      () => context.router.replace(const HomeRoute()),
    );
  }

  @override
  Widget build(BuildContext context) {
    S strings = S.of(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            strings.app_name,
            style: textBold.copyWith(
              fontSize: 48,
            ),
          ),
        ),
      ),
    );
  }
}
