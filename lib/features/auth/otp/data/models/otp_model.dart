import 'package:milk_ride_live_wc/features/auth/otp/domain/entities/otp_response.dart';

class OtpModel extends OtpResponse {
  OtpModel(
    super.mobileNumber,
    super.userId,
    super.otp,
    super.status,
    super.statusCode,
    super.message,
    super.data,
  );

  factory OtpModel.fromJson(Map<String, dynamic> json) {
    return OtpModel(
      json['mobileNumber'],
      json['userId'],
      json['otp'],
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
      'otp': otp,
      'status': status,
      'statusCode': statusCode,
      'message': message,
      'data': data,
    };
  }
}
