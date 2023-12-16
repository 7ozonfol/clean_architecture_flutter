import 'package:flutter/material.dart';
import 'package:nawy_task/core/config/page_route_names.dart';
import 'package:nawy_task/features/search/presentation/pages/result_screen.dart';
import 'package:nawy_task/features/search/presentation/pages/search_screen.dart';

/// Holds all the routes and provide the projects with needed routes
class Routes {
  /// Generates routes for the app
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.initial:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const SearchScreen(), settings: settings);
      case PageRouteName.resultScreen:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const ResultScreen(), settings: settings);
      default:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const SearchScreen(), settings: settings);
    }
  }
}
