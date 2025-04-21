import 'package:milk_ride_live_wc/features/product/domain/entities/product_details_entity.dart';
import 'package:milk_ride_live_wc/features/product/domain/entities/product_response.dart';

class ProductModel extends ProductResponse {
  ProductModel({super.status, super.statusCode, super.message, super.data});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      status: json['status'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: json['data'] != null
          ? ProductDetailsEntity.fromJson(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
