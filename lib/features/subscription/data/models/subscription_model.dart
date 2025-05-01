import 'package:milk_ride_live_wc/features/subscription/domain/entities/subscription_data.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/entities/subscription_response.dart';

class SubscriptionModel extends SubscriptionResponse {
  SubscriptionModel({
    super.status,
    super.statusCode,
    super.message,
    super.data,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      status: json['status'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: json['data'] != null
          ? List<SubscriptionData>.from(
              json['data'].map((x) => SubscriptionData.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
