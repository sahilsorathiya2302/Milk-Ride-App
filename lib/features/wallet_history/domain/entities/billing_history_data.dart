import 'package:milk_ride_live_wc/features/wallet_history/domain/entities/billing_history_info_data.dart';

class BillingHistoryData {
  String? date;
  List<BillingHistoryInfoData>? data;

  BillingHistoryData({this.date, this.data});

  BillingHistoryData.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['data'] != null) {
      data = <BillingHistoryInfoData>[];
      json['data'].forEach((v) {
        data?.add(BillingHistoryInfoData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
