import 'package:milk_ride_live_wc/features/wallet_history/domain/entities/recharge_history_response.dart';

import '../../domain/entities/recharge_history_data.dart';

class RechargeHistoryModel extends RechargeHistoryResponse {
  RechargeHistoryModel(
      {super.status, super.statusCode, super.message, super.data});

  factory RechargeHistoryModel.fromJson(Map<String, dynamic> json) {
    return RechargeHistoryModel(
      status: json['status'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: json['data'] != null
          ? List<RechargeHistoryData>.from(
              json['data'].map((v) => RechargeHistoryData.fromJson(v)))
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
