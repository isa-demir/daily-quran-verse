class BaseException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  BaseException({required this.message, this.stackTrace});

  @override
  String toString() {
    return "Exception: $message";
  }
}

class NetworkException extends BaseException {
  NetworkException({required super.message, super.stackTrace});
}

class ServerException extends BaseException {
  ServerException({required super.message, super.stackTrace});
}

class DatabaseException extends BaseException {
  DatabaseException({required super.message, super.stackTrace});
}
