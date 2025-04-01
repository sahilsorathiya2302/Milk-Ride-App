import 'package:milk_ride_live_wc/features/product/domain/entities/categories_product_data.dart';

class CategoriesProductResponse {
  final String? status;
  final int? statusCode;
  final String? message;
  final List<CategoriesProductData>? data;

  CategoriesProductResponse(
      {required this.status,
      required this.statusCode,
      required this.message,
      required this.data});
}
