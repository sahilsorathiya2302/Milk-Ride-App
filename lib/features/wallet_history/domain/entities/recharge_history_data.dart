import 'package:milk_ride_live_wc/features/wallet_history/domain/entities/recharge_history_info_data.dart';

class RechargeHistoryData {
  String? date;
  List<RechargeHistoryInfoData>? data;

  RechargeHistoryData({this.date, this.data});

  RechargeHistoryData.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['data'] != null) {
      data = <RechargeHistoryInfoData>[];
      json['data'].forEach((v) {
        data!.add(RechargeHistoryInfoData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
