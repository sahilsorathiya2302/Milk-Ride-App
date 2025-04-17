import 'package:milk_ride_live_wc/features/cart/domain/entities/cart_data.dart';

class CartResponse {
  final String? status;
  final int? statusCode;
  final String? message;
  final CartData? data;

  CartResponse(
      {required this.status,
      required this.statusCode,
      required this.message,
      required this.data});
}
