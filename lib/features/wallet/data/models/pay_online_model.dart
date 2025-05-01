import 'package:milk_ride_live_wc/features/wallet/domain/entities/pay_online_data.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/entities/pay_online_response.dart';

class PayOnlineModel extends PayOnlineResponse {
  PayOnlineModel({super.status, super.statusCode, super.message, super.data});

  factory PayOnlineModel.fromJson(Map<String, dynamic> json) {
    return PayOnlineModel(
      status: json['status'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: json['data'] != null ? PayOnlineData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
