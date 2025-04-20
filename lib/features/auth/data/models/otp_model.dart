import 'package:milk_ride_live_wc/features/auth/domain/entities/otp_response.dart';

import '../../domain/entities/customer.dart';

class OtpVerifyModel extends OtpResponse {
  OtpVerifyModel(
    super.status,
    super.statusCode,
    super.message,
    super.data,
    super.appToken,
    super.customer,
  );

  factory OtpVerifyModel.fromJson(Map<String, dynamic> json) {
    return OtpVerifyModel(
      json['status'],
      json['statusCode'],
      json['message'],
      json['data'],
      json['app_token'],
      json['customer'] != null ? Customer.fromJson(json['customer']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['statusCode'] = statusCode;
    data['message'] = message;
    data['data'] = this.data;
    data['app_token'] = appToken;
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    return data;
  }
}
