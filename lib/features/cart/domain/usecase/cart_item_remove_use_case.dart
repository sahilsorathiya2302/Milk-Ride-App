import 'package:fpdart/src/either.dart';
import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';
import 'package:milk_ride_live_wc/features/cart/domain/repositories/cart_repository.dart';

class CartItemRemoveUseCase
    implements UseCase<ApiResponseModel, CartItemRemoveParam> {
  final CartRepository cartRepository;

  CartItemRemoveUseCase({required this.cartRepository});

  @override
  Future<Either<Failure, ApiResponseModel>> call(
      CartItemRemoveParam param) async {
    return await cartRepository.removeCartItem(param: param);
  }
}

class CartItemRemoveParam {
  final int cartId;

  CartItemRemoveParam({required this.cartId});
}
