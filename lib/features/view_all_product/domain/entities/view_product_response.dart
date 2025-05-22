import 'package:milk_ride_live_wc/features/view_all_product/domain/entities/view_product_data.dart';

class ViewProductResponse {
  final String? status;
  final int? statusCode;
  final String? message;
  final List<ViewProductData>? data;

  ViewProductResponse(
      {required this.status,
      required this.statusCode,
      required this.message,
      required this.data});
}
