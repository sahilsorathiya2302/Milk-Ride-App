import 'package:milk_ride_live_wc/features/order/domain/entities/order_package.dart';
import 'package:milk_ride_live_wc/features/order/domain/entities/order_reasons.dart';

class OrderData {
  List<OrderPackage>? toBeDelivered;
  List<OrderPackage>? delivered;
  List<OrderPackage>? refund;
  List<OrderReasons>? orderReasons;

  OrderData(
      {this.toBeDelivered, this.delivered, this.refund, this.orderReasons});

  OrderData.fromJson(Map<String, dynamic> json) {
    if (json['to_be_delivered'] != null) {
      toBeDelivered = <OrderPackage>[];
      json['to_be_delivered'].forEach((v) {
        toBeDelivered!.add(OrderPackage.fromJson(v));
      });
    }
    if (json['delivered'] != null) {
      delivered = <OrderPackage>[];
      json['delivered'].forEach((v) {
        delivered!.add(OrderPackage.fromJson(v));
      });
    }
    if (json['refund'] != null) {
      refund = <OrderPackage>[];
      json['refund'].forEach((v) {
        refund!.add(OrderPackage.fromJson(v));
      });
    }
    if (json['order_reasons'] != null) {
      orderReasons = <OrderReasons>[];
      json['order_reasons'].forEach((v) {
        orderReasons!.add(OrderReasons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (toBeDelivered != null) {
      data['to_be_delivered'] = toBeDelivered!.map((v) => v.toJson()).toList();
    }
    if (delivered != null) {
      data['delivered'] = delivered!.map((v) => v.toJson()).toList();
    }
    if (refund != null) {
      data['refund'] = refund!.map((v) => v.toJson()).toList();
    }
    if (orderReasons != null) {
      data['order_reasons'] = orderReasons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
