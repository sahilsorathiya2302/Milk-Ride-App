import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/features/cart/domain/entities/cart_response.dart';
import 'package:milk_ride_live_wc/features/cart/domain/usecase/cart_item_remove_use_case.dart';
import 'package:milk_ride_live_wc/features/cart/domain/usecase/cart_quantity_update_use_case.dart';

abstract class CartRepository {
  Future<Either<Failure, CartResponse>> addToCart({required int customerId});
  Future<Either<Failure, ApiResponseModel>> removeCartItem(
      {required CartItemRemoveParam param});
  Future<Either<Failure, ApiResponseModel>> updateCartItemQty(
      {required CartQuantityUpdateParam param});
}
