abstract class Failure {
  final String message;

  const Failure({required this.message});

  @override
  String toString() => 'Failure(message: $message)';
}

class NetworkFailure extends Failure {
  const NetworkFailure(String message) : super(message: message);
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message});
}
