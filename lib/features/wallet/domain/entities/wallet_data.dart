import 'package:milk_ride_live_wc/features/wallet/domain/entities/wallet_history.dart';

import 'customer_data.dart';

class WalletData {
  CustomerData? customerData;
  List<WalletHistory>? walletHistory;

  WalletData({this.customerData, this.walletHistory});

  WalletData.fromJson(Map<String, dynamic> json) {
    customerData = json['customerData'] != null
        ? CustomerData.fromJson(json['customerData'])
        : null;
    if (json['walletHistory'] != null) {
      walletHistory = <WalletHistory>[];
      json['walletHistory'].forEach((v) {
        walletHistory!.add(WalletHistory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (customerData != null) {
      data['customerData'] = customerData!.toJson();
    }
    if (walletHistory != null) {
      data['walletHistory'] = walletHistory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
