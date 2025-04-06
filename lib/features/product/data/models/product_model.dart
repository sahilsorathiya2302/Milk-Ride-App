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
          ? new ProductDetailsEntity.fromJson(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
