import 'package:milk_ride_live_wc/features/auth/otp/domain/entities/resend_otp_response.dart';

class ResendOtpModel extends ResendOtpResponse {
  ResendOtpModel(
    super.mobileNumber,
    super.userId,
    super.status,
    super.statusCode,
    super.message,
    super.data,
  );

  factory ResendOtpModel.fromJson(Map<String, dynamic> json) {
    return ResendOtpModel(
      json['mobileNumber'],
      json['userId'],
      json['status'],
      json['statusCode'],
      json['message'],
      json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mobileNumber': mobileNumber,
      'userId': userId,
      'status': status,
      'statusCode': statusCode,
      'message': message,
      'data': data,
    };
  }
}
