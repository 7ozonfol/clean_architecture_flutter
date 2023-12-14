import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/Theme/app_theme.dart';
import 'core/config/page_route_names.dart';
import 'core/config/providers.dart';
import 'core/config/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// force the app orientation and default style
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.grey,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return AppProviders.multiProvider(
      child: MaterialApp(
        title: 'Nawy task Demo',
        theme: appTheme,
        navigatorKey: AppProviders.navigatorKey,
        debugShowCheckedModeBanner: false,
        initialRoute: PageRouteName.initial,
        onGenerateRoute: Routes.generateRoute,
        locale: const Locale("en"),
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1.0,
            ),
            child: child!,
          );
        },
      ),
    );
  }
}
