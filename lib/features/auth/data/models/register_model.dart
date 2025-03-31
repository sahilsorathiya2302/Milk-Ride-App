import 'package:milk_ride_live_wc/features/auth/domain/entities/register_response.dart';

import '../../domain/entities/customer.dart';

class RegisterModel extends RegisterResponse {
  RegisterModel(super.status, super.statusCode, super.message, super.customer,
      super.appToken);

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      json['status'],
      json['statusCode'],
      json['message'],
      json['customer'] != null ? Customer.fromJson(json['customer']) : null,
      json['app_token'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    data['app_token'] = appToken;
    return data;
  }
}
