import 'package:milk_ride_live_wc/features/view_all_product/domain/entities/view_product_response.dart';

import '../../domain/entities/view_product_data.dart';

class ViewAllProductsModel extends ViewProductResponse {
  ViewAllProductsModel(
      {super.status, super.statusCode, super.message, super.data});

  factory ViewAllProductsModel.fromJson(Map<String, dynamic> json) {
    return ViewAllProductsModel(
      status: json['status'],
      statusCode: json['statusCode'],
      message: json['message'],
      data:
          json['data'] != null ? [ViewProductData.fromJson(json['data'])] : [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}
