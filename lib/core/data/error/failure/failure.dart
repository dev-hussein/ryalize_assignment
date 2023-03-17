
import 'package:flutter/foundation.dart';
import 'package:ryalize_assignment/constants/app_string_constants.dart';
import 'package:ryalize_assignment/core/data/error/exceptions/client/client_exception.dart';
import 'package:ryalize_assignment/core/data/error/exceptions/server/server_exception.dart';
import 'package:ryalize_assignment/core/data/error/failure/client/client_failure.dart';
import 'package:ryalize_assignment/core/data/error/failure/server/server_failure.dart';
import 'package:ryalize_assignment/utils/localization/app_localization.dart';

abstract class Failure {
  final String message;

  Failure({required this.message});
}

///
/// Can be used when the list of exceptions is exhausted. Also, It maps to [GenericApplicationException].
///
class GenericFailure extends Failure {
  final bool isAction;

  GenericFailure({required String message, this.isAction = false})
      : super(message: message);
}

Failure dioExceptionsDecoder(
  Exception e, {
  VoidCallback? unauthorizedAccessHandler,
  bool Function()? isAction,
}) {
  final isAnAction = isAction != null && isAction.call();
  if (e is ClientException) {
    return e.when(
      unknown: (message) =>
          ClientFailure.unknown(message: message, isAction: isAnAction),
      resourceNotFound: (resourceName, message) =>
          ClientFailure.resourceNotFound(
              message: message, isAction: isAnAction),
      unauthorizedAccess: () {
        if (unauthorizedAccessHandler != null) {
          unauthorizedAccessHandler();
        }
        return ClientFailure.unauthorizedAccess(
            isAction: isAnAction,
            message: AppLocalizationKeys.kUnAuthorizedAccess.translate);
      },
      networkError: (String message) =>
          ClientFailure.networkError(message: message, isAction: isAnAction),
      cacheError: (String message) =>
          ClientFailure.cacheError(message: message),
      badRequest: (message) =>
          ClientFailure.badRequest(message: message, isAction: isAnAction),
      forbiddenAccess: (String message) =>
          ClientFailure.forbiddenAccess(message: message, isAction: isAnAction),
    );
  } else if (e is ServerException) {
    return e.when(
        unknown: (message) =>
            ServerFailure.unknown(message: message, isAction: isAnAction),
        internalError: (message) =>
            ServerFailure.internalError(message: message, isAction: isAnAction),
        serviceUnavailable: (message) => ServerFailure.serviceUnavailable(
            message: message, isAction: isAnAction));
  } else {
    return GenericFailure(
        message: AppLocalizationKeys.kSomethingWentWrongText.translate,
        isAction: isAnAction);
  }
}
