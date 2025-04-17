class DeliveryDetails {
  String? deliveryDate;
  String? deliveryAddress;
  String? customerId;

  DeliveryDetails({this.deliveryDate, this.deliveryAddress, this.customerId});

  DeliveryDetails.fromJson(Map<String, dynamic> json) {
    deliveryDate = json['delivery_date'];
    deliveryAddress = json['delivery_address'];
    customerId = json['customer_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['delivery_date'] = this.deliveryDate;
    data['delivery_address'] = this.deliveryAddress;
    data['customer_id'] = this.customerId;
    return data;
  }
}
