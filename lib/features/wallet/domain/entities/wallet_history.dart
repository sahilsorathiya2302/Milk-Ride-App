class WalletHistory {
  int? id;
  String? createdAt;
  String? amountType;
  int? amount;
  String? walletReason;
  String? paymentStatus;

  WalletHistory(
      {this.id,
      this.createdAt,
      this.amountType,
      this.amount,
      this.walletReason,
      this.paymentStatus});

  WalletHistory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    amountType = json['amount_type'];
    amount = json['amount'];
    walletReason = json['wallet_reason'];
    paymentStatus = json['payment_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['amount_type'] = amountType;
    data['amount'] = amount;
    data['wallet_reason'] = walletReason;
    data['payment_status'] = paymentStatus;
    return data;
  }
}
