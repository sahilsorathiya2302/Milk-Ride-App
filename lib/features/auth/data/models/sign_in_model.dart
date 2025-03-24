import 'package:milk_ride_live_wc/features/auth/sign_in/domain/entities/sign_in_response.dart';

class SignInModel extends SignInResponse {
  final String mobileNumber;

  SignInModel({
    required super.status,
    required super.statusCode,
    required super.message,
    required super.data,
    required super.userId,
    this.mobileNumber = "",
  });

  // No need to parse mobileNumber from response
  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
      status: json['status'] ?? "",
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? "",
      data: json['data'] ?? "",
      userId: json['user_id'] ?? 0,
    );
  }

  // Only send mobileNumber in request
  Map<String, dynamic> toJson() {
    return {
      'mobileNumber': mobileNumber,
      'user_id': userId,
      'status': status,
      'statusCode': statusCode,
      'message': message,
      'data': data,
    };
  }
}
