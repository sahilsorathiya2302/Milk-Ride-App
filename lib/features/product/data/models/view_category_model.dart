import 'package:milk_ride_live_wc/features/product/domain/entities/cetegories.dart';
import 'package:milk_ride_live_wc/features/product/domain/entities/view_category_response.dart';

class ViewCategoryModel extends ViewCategoryResponse {
  ViewCategoryModel(
      {super.status, super.statusCode, super.message, super.data});

  factory ViewCategoryModel.fromJson(Map<String, dynamic> json) {
    return ViewCategoryModel(
      message: json['message'],
      statusCode: json['statusCode'],
      status: json['status'],
      data: json['data'] != null
          ? (json['data'] as List).map((v) => Categories.fromJson(v)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
