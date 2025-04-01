import 'package:milk_ride_live_wc/features/product/domain/entities/categories_product_data.dart';
import 'package:milk_ride_live_wc/features/product/domain/entities/categories_product_response.dart';

class CategoriesProductModel extends CategoriesProductResponse {
  CategoriesProductModel(
      {super.status, super.statusCode, super.message, super.data});

  factory CategoriesProductModel.fromJson(Map<String, dynamic> json) {
    return CategoriesProductModel(
      status: json['status'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: json['data'] != null
          ? (json['data'] as List)
              .map((v) => CategoriesProductData.fromJson(v))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
