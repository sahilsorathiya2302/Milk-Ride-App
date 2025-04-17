import 'package:milk_ride_live_wc/features/cart/domain/entities/cart_data.dart';
import 'package:milk_ride_live_wc/features/cart/domain/entities/cart_response.dart';

class CartModel extends CartResponse {
  CartModel({
    super.status,
    super.statusCode,
    super.message,
    super.data,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      status: json['status'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: CartData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'statusCode': statusCode,
        'message': message,
        'data': data?.toJson(),
      };
}
