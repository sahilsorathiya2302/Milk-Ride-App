import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/utils/exception_handler.dart';
import 'package:milk_ride_live_wc/features/cart/data/repositories/cart_impl_remote_repo.dart';
import 'package:milk_ride_live_wc/features/cart/domain/entities/cart_response.dart';
import 'package:milk_ride_live_wc/features/cart/domain/repositories/cart_repository.dart';
import 'package:milk_ride_live_wc/features/cart/domain/usecase/cart_item_remove_use_case.dart';
import 'package:milk_ride_live_wc/features/cart/domain/usecase/cart_quantity_update_use_case.dart';

class CartImplRepository extends CartRepository {
  final CartRemoteRepo cartRemoteRepo;
  CartImplRepository({required this.cartRemoteRepo});

  @override
  Future<Either<Failure, CartResponse>> addToCart(
      {required int customerId}) async {
    try {
      final result = await cartRemoteRepo.addToCart(customerId: customerId);
      return right(result);
    } on DioException catch (e) {
      return left(ExceptionHandler.handleError(error: e));
    }
  }

  @override
  Future<Either<Failure, ApiResponseModel>> removeCartItem(
      {required CartItemRemoveParam param}) async {
    try {
      final result = await cartRemoteRepo.removeCartItem(param: param);
      return right(result);
    } on DioException catch (e) {
      return left(ExceptionHandler.handleError(error: e));
    }
  }

  @override
  Future<Either<Failure, ApiResponseModel>> updateCartItemQty(
      {required CartQuantityUpdateParam param}) async {
    try {
      final result = await cartRemoteRepo.updateCartItemQty(param: param);
      return right(result);
    } on DioException catch (e) {
      return left(ExceptionHandler.handleError(error: e));
    }
  }
}
