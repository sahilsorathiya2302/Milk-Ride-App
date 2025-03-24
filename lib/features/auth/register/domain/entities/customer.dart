class Customer {
  int? id;
  String? name;
  String? mobileNumber;
  String? email;
  String? gender;
  String? deliveryType;
  int? isPostpaid;

  Customer(
      {this.id,
      this.name,
      this.mobileNumber,
      this.email,
      this.gender,
      this.deliveryType,
      this.isPostpaid});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobileNumber = json['mobile_number'];
    email = json['email'];
    gender = json['gender'];
    deliveryType = json['delivery_type'];
    isPostpaid = json['is_postpaid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['mobile_number'] = mobileNumber;
    data['email'] = email;
    data['gender'] = gender;
    data['delivery_type'] = deliveryType;
    data['is_postpaid'] = isPostpaid;
    return data;
  }
}
