import 'package:milk_ride_live_wc/features/order/domain/entities/order_data.dart';
import 'package:milk_ride_live_wc/features/order/domain/entities/order_response.dart';

class OrderModel extends OrderResponse {
  OrderModel(
      {super.status,
      super.statusCode,
      super.message,
      super.data,
      super.toBeDeliveredGrandTotal,
      super.toBeDeliveredGrandTotalDecimal,
      super.deliveredGrandTotal,
      super.deliveredGrandTotalDecimal,
      super.refundGrandTotal,
      super.refundGrandTotalDecimal});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
        status: json['status'],
        statusCode: json['statusCode'],
        message: json['message'],
        data: json['data'] != null ? OrderData.fromJson(json['data']) : null,
        toBeDeliveredGrandTotal: json['to_be_delivered_grand_total'],
        toBeDeliveredGrandTotalDecimal:
            json['to_be_delivered_grand_total_decimal'],
        deliveredGrandTotal: json['delivered_grand_total'],
        deliveredGrandTotalDecimal: json['delivered_grand_total_decimal'],
        refundGrandTotal: json['refund_grand_total'],
        refundGrandTotalDecimal: json['refund_grand_total_decimal']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['to_be_delivered_grand_total'] = toBeDeliveredGrandTotal;
    data['to_be_delivered_grand_total_decimal'] =
        toBeDeliveredGrandTotalDecimal;
    data['delivered_grand_total'] = deliveredGrandTotal;
    data['delivered_grand_total_decimal'] = deliveredGrandTotalDecimal;
    data['refund_grand_total'] = refundGrandTotal;
    data['refund_grand_total_decimal'] = refundGrandTotalDecimal;
    return data;
  }
}
