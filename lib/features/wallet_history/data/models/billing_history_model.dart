import 'package:milk_ride_live_wc/features/wallet_history/domain/entities/billing_history_data.dart';
import 'package:milk_ride_live_wc/features/wallet_history/domain/entities/billing_history_response.dart';

class BillingHistoryModel extends BillingHistoryResponse {
  BillingHistoryModel(
      {super.status, super.statusCode, super.message, super.data});

  factory BillingHistoryModel.fromJson(Map<String, dynamic> json) {
    return BillingHistoryModel(
      status: json['status'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: json['data'] != null
          ? List<BillingHistoryData>.from(
              json['data'].map((v) => BillingHistoryData.fromJson(v)))
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
