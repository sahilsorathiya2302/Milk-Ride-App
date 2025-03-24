class SignInResponse {
  final String status;
  final int statusCode;
  final String message;
  final String data;
  final int userId;
  SignInResponse({
    required this.status,
    required this.message,
    required this.statusCode,
    required this.data,
    required this.userId,
  });
}
