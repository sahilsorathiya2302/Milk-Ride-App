import 'package:milk_ride_live_wc/features/product/domain/entities/cetegories.dart';

class ViewCategoryResponse {
  final String? status;
  final int? statusCode;
  final String? message;
  final List<Categories>? data;

  ViewCategoryResponse(
      {required this.status,
      required this.statusCode,
      required this.message,
      required this.data});
}
