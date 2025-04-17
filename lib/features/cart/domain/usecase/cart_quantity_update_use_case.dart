import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';
import 'package:milk_ride_live_wc/features/cart/domain/repositories/cart_repository.dart';

class CartQuantityUpdateUseCase
    implements UseCase<ApiResponseModel, CartQuantityUpdateParam> {
  final CartRepository cartRepository;
  CartQuantityUpdateUseCase({required this.cartRepository});

  @override
  Future<Either<Failure, ApiResponseModel>> call(
      CartQuantityUpdateParam param) async {
    return await cartRepository.updateCartItemQty(param: param);
  }
}

class CartQuantityUpdateParam {
  final String cart;
  CartQuantityUpdateParam({required this.cart});
}
