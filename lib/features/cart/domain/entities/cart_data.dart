import 'package:milk_ride_live_wc/features/cart/domain/entities/delivery_details.dart';
import 'package:milk_ride_live_wc/features/cart/domain/entities/package_data.dart';

class CartData {
  List<PackageData>? package;
  DeliveryDetails? deliveryDetails;

  CartData({this.package, this.deliveryDetails});

  CartData.fromJson(Map<String, dynamic> json) {
    if (json['package'] != null) {
      package = <PackageData>[];
      json['package'].forEach((v) {
        package!.add(PackageData.fromJson(v));
      });
    }
    deliveryDetails = json['delivery_details'] != null
        ? DeliveryDetails.fromJson(json['delivery_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (package != null) {
      data['package'] = package!.map((v) => v.toJson()).toList();
    }
    if (deliveryDetails != null) {
      data['delivery_details'] = deliveryDetails!.toJson();
    }
    return data;
  }
}
