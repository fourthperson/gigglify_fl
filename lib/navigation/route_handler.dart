import 'package:auto_route/auto_route.dart';
import 'package:gigglify_fl/navigation/route_handler.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
      ];
}
