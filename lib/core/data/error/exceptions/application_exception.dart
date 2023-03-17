abstract class ApplicationException implements Exception {}

class GenericApplicationException extends ApplicationException {
  final String? message;

  GenericApplicationException({required this.message});
}

