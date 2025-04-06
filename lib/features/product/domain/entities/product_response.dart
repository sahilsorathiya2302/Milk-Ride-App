import 'package:milk_ride_live_wc/features/product/domain/entities/product_details_entity.dart';

class ProductResponse {
  final String? status;
  final int? statusCode;
  final String? message;
  final ProductDetailsEntity? data;

  ProductResponse(
      {required this.status,
      required this.statusCode,
      required this.message,
      required this.data});
}
