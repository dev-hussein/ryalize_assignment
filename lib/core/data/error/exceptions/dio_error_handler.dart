
import 'package:dio/dio.dart';
import 'package:ryalize_assignment/constants/app_string_constants.dart';
import 'package:ryalize_assignment/utils/localization/app_localization.dart';

import 'application_exception.dart';
import 'client/client_exception.dart';
import 'server/server_exception.dart';


///
/// Handle the [Dio] errors
///

void dioErrorDecoder(DioError e, String resourceName) {
  if (e.type == DioErrorType.badResponse) {
    _decodeResponseError(e, resourceName: resourceName);
  } else {
    throw ClientException.networkError(
        message: AppLocalizationKeys.kNotConnectedToInternet.translate);
  }
}

void _decodeResponseError(DioError e, {String resourceName = ''}) {
  if (e.response?.statusCode.toString()[0] == "4") {
    decodeClientErrors(e, resourceName: resourceName);
  } else if (e.response?.statusCode.toString()[0] == "5") {
    decodeServerErrors(e.response?.statusCode, e.message ?? '');
  } else {
    throw GenericApplicationException(message: AppLocalizationKeys.kSomethingWentWrongText.translate);
  }
}

void decodeServerErrors(int? statusCode, String message) {
  switch (statusCode) {
    case 500:
      throw ServerException.internalError(
          message: AppLocalizationKeys.kSomethingWentWrongText.translate);
    case 503:
      throw ServerException.serviceUnavailable(
          message: AppLocalizationKeys.kServiceError.translate);
    default:
      throw ServerException.unknown(message: message);
  }
}

void decodeClientErrors(DioError e, {String resourceName = ''}) {
  switch (e.response?.statusCode) {
    case 401:
      throw const ClientException.unauthorizedAccess();
    case 403:
      throw ClientException.forbiddenAccess(
        message: AppLocalizationKeys.kForbiddenAccessError.translate,
      );
    case 404:
      throw ClientException.resourceNotFound(
        resourceName: resourceName,
        message: AppLocalizationKeys.kContentError.translate,
      );
    case 400:
      final response = e.response?.data['response_message'];
      throw ClientException.badRequest(
          message: (response is String)
              ? response
              : AppLocalizationKeys.kSomethingWentWrongText.translate);
    default:
      throw ClientException.unknown(message: AppLocalizationKeys.kSomethingWentWrongText.translate);
  }
}
