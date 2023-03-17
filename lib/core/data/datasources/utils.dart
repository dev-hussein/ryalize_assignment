import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:logging/logging.dart';
import 'package:ryalize_assignment/constants/app_string_constants.dart';
import 'package:ryalize_assignment/core/data/error/exceptions/application_exception.dart';
import 'package:ryalize_assignment/core/data/error/exceptions/dio_error_handler.dart';
import 'package:ryalize_assignment/utils/localization/app_localization.dart';

///
/// This handle the error if happened for the [Dio] Requests
///

Future<T> resolveOrThrow<T>(
  Future<T> Function() target, {
    String? context,
}) async {
  try {
    return await target();
  } on DioError catch(e, s) {
    if(kDebugMode) {
      log("DioError:\n $e", level: Level.SEVERE.value, stackTrace: s);
    }
    dioErrorDecoder(e, context ?? '');
  } on Exception catch (e, s) {
    if(kDebugMode) {
      log("DataSourceError:\n $e", level: Level.SEVERE.value, stackTrace: s);
    }
    throw GenericApplicationException(message: AppLocalizationKeys.kSomethingWentWrongText.translate);
  } catch (e, s) {
    if (kDebugMode) {
      log("DataSourceError:\n $e", level: Level.SEVERE.value, stackTrace: s);
    }
    throw GenericApplicationException(message: AppLocalizationKeys.kSomethingWentWrongText.translate);
  }
  throw GenericApplicationException(message: AppLocalizationKeys.kSomethingWentWrongText.translate);
}
