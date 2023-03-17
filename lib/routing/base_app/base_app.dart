
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ryalize_assignment/constants/app_colors.dart';

import 'package:ryalize_assignment/routing/app_router.dart';
import 'package:ryalize_assignment/utils/Theming/theme.dart';
import 'package:ryalize_assignment/utils/localization/app_localization.dart';
import 'package:ryalize_assignment/utils/services/di/injection_container.dart';

///
/// This class contains initial Theme, Navigation and Language of the app.
///

class BaseApp extends StatefulWidget {
  const BaseApp({Key? key}) : super(key: key);

  @override
  State<BaseApp> createState() => _BaseAppState();
}

class _BaseAppState extends State<BaseApp> {




  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        // A class which loads the translations
        AppLocalizationDelegate(),
        // Built-in localization of basic text for Material widgets
        GlobalMaterialLocalizations.delegate,
        // Built-in localization for text direction LTR/RTL
        GlobalWidgetsLocalizations.delegate,
        // Built-in localization of basic text for Cupertino widgets
        GlobalCupertinoLocalizations.delegate,

      ],

      supportedLocales: AppLocalizationDelegate.supportedLocales,
      theme: AppLightTheme().themeData,
      darkTheme: AppDarkTheme().themeDarkData,
      themeMode: ThemeMode.light,
      locale: const Locale('en'),
      color: AppColors.color6C6DB5,
      routeInformationProvider: locator<AppRouter>().routeInfoProvider(),
      routeInformationParser: locator<AppRouter>().defaultRouteParser(),
      routerDelegate: AutoRouterDelegate(
        locator<AppRouter>(),
        // Provide an AutoRouteObserver instance
        navigatorObservers: () => [AutoRouteObserver()],
      ),
      // routerDelegate: locator<AppRouter>().delegate(),
    );
  }
}
