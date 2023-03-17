
import 'package:ryalize_assignment/core/data/error/exceptions/application_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_exception.freezed.dart';

@freezed
class ServerException extends ApplicationException
    with _$ServerException {
  const factory ServerException.unknown({required String message}) = Unknown;

  const factory ServerException.internalError({required String message}) =
      InternalError;

  const factory ServerException.serviceUnavailable({required String message}) =
      ServiceUnavailable;
}
