class OtpResponse {
  final String? status;
  final int? statusCode;
  final String? message;
  final String? data;
  final String? mobileNumber;
  final int? userId;
  final String? otp;

  OtpResponse(this.mobileNumber, this.userId, this.otp, this.status,
      this.statusCode, this.message, this.data);
}
