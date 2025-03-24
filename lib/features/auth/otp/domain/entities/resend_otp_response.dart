class ResendOtpResponse {
  final String? status;
  final int? statusCode;
  final String? message;
  final String? data;
  final String? mobileNumber;
  final int? userId;

  ResendOtpResponse(this.mobileNumber, this.userId, this.status,
      this.statusCode, this.message, this.data);
}
