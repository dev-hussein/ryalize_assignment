import 'dart:developer';

import 'package:auto_route/auto_route.dart';

import 'package:injectable/injectable.dart';
import 'package:ryalize_assignment/constants/app_string_constants.dart';
import 'package:ryalize_assignment/core/presentation/common_widgets/toast.dart';
import 'package:ryalize_assignment/utils/localization/app_localization.dart';
import 'package:ryalize_assignment/utils/services/di/injection_container.dart';


///
///
/// The [authGuard] is a guard used to prevent user to navigate to the screen if not authorized
///
/// [isAuthenticated] can set the value from the preferences by checking the user authority
/// So if not authorized the guard will navigate the user to login or register screen
///


@lazySingleton
class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    const isAuthenticated = true;

    if(!isAuthenticated) {
      /*
      * if the user not authorized
      * jump to login or register screen
      * then you can resolve to the next screen or prevent the user to proceed
      */


    } else {
      resolver.next();
    }
  }


}
