import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:ryalize_assignment/features/home/presentation/pages/home_page.dart';
import 'package:ryalize_assignment/features/imdb/presentation/pages/page_imdb.dart';
import 'package:ryalize_assignment/routing/route_enum.dart';

import 'guards/auth_guard.dart';

part 'app_router.gr.dart';


///
/// What is AutoRoute?
///
/// It’s a Flutter navigation package,
/// it allows for strongly-typed arguments passing,
/// effortless deep-linking and it uses code generation to simplify routes setup,
/// with that being said it requires a minimal amount of code to generate everything needed for navigation inside of your App.
///
/// Check https://pub.dev/packages/auto_route for more details



@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    CustomRoute(
      page: HomePage,
      path: EnumRoute.initialRoute,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      initial: true,
    ),
    AutoRoute(page: ImdbPage, path: EnumRoute.imdbScreen, guards: [AuthGuard]),
  ],
)



///
/// Can add guards to according to the app business to check if the user can navigate t
/// o the screen he want or not.
///
/// e.g.
/// The [authGuard] is a guard used to prevent user to navigate to the screen if not authorized
///
/// So if not authorized you can navigate the user to login or register screen
///

@singleton
class AppRouter extends _$AppRouter {
  AppRouter({
    required AuthGuard authGuard,
  }) : super(
    authGuard: authGuard,
  );
}
