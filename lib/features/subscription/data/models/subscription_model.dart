import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';

class SubscriptionModel extends ApiResponseModel {
  SubscriptionModel(
      {super.status, super.statusCode, super.message, super.data});

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      status: json['status'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: json['data'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['statusCode'] = statusCode;
    data['message'] = message;
    data['data'] = this.data;
    return data;
  }
}
