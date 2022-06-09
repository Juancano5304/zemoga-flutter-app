import 'package:flutter/material.dart';
import 'package:zemoga_flutter_app/core/navigation/named_routes.dart';
import 'package:zemoga_flutter_app/features/main/display/pages/main_page.dart';

class AppRouter {
  static RouteFactory get generatedRoutes => (RouteSettings settings) {
        ModalRoute? route;
        switch (settings.name) {
          case NamedRoutes.home:
            route = MaterialPageRoute(
              builder: (_) => const MainPage(),
              settings: RouteSettings(
                name: settings.name,
              ),
            );
            break;
          case NamedRoutes.details:
            route = MaterialPageRoute(
              builder: (_) => const MainPage(),
              settings: RouteSettings(
                name: settings.name,
              ),
            );
            break;
        }
        return route;
      };
}
