abstract class Failure {
  final String message;

  const Failure({required this.message});

  @override
  String toString() => 'Failure(message: $message)';
}

class NetworkFailure extends Failure {
  const NetworkFailure(String message) : super(message: message);
}

// Server Failure (API issues, 500 error, etc.)
class ServerFailure extends Failure {
  const ServerFailure({required super.message});
}

// Unexpected Failure (Unknown Errors)
class UnexpectedFailure extends Failure {
  const UnexpectedFailure(String message) : super(message: message);
}
