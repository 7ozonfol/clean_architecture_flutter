import 'package:flutter/material.dart';
import 'package:nawy_task/features/search/presentation/providers/search_provider.dart';

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/// This class manages all the providers and provide them to the project
class AppProviders {
  /// Providers which are required by the app project
  static final List<SingleChildWidget> _appProvidersList = [
    ChangeNotifierProvider(
      create: (context) => SearchProvider(),
    ),
  ];

  /// Navigatorkey used to navigate to any page under any app
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  /// Provides the required providers to run the project
  static Widget multiProvider({
    required Widget child,
  }) {
    return MultiProvider(
      providers: _appProvidersList,
      child: child,
    );
  }
}
