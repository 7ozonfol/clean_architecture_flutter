import 'package:flutter/material.dart';
import 'package:nawy_task/core/config/page_route_names.dart';
import 'package:nawy_task/features/search/presentation/pages/search_screen.dart';

/// Holds all the routes and provide the projects with needed routes
class Routes {
  /// Generates routes for the app
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.initial:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const SearchScreen(), settings: settings);
      // case PageRouteName.resultListScreen:
      //   return MaterialPageRoute<dynamic>(
      //       builder: (_) => const resultListScreen(), settings: settings);
      default:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const SearchScreen(), settings: settings);
    }
  }
}
