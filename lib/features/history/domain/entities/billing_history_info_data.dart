class BillingHistoryInfoData {
  String? date;
  String? paymentType;
  String? amount;
  String? balance;
  String? reason;
  String? paymentStatus;

  BillingHistoryInfoData(
      {this.date,
      this.paymentType,
      this.amount,
      this.balance,
      this.reason,
      this.paymentStatus});

  BillingHistoryInfoData.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    paymentType = json['payment_type'];
    amount = json['amount'];
    balance = json['balance'];
    reason = json['reason'];
    paymentStatus = json['payment_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['payment_type'] = paymentType;
    data['amount'] = amount;
    data['balance'] = balance;
    data['reason'] = reason;
    data['payment_status'] = paymentStatus;
    return data;
  }
}
