class Failure {
  final String message;
  final String? details;

  Failure({required this.message, this.details});

  @override
  String toString() {
    return "Failure: $message, Details: $details";
  }
}

class NetworkFailure extends Failure {
  NetworkFailure({required super.message, super.details});
}

class DatabaseFailure extends Failure {
  DatabaseFailure({required super.message, super.details});
}

class ValidationFailure extends Failure {
  ValidationFailure({required super.message, super.details});
}
