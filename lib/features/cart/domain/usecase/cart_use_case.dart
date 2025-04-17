import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';
import 'package:milk_ride_live_wc/features/cart/domain/entities/cart_response.dart';
import 'package:milk_ride_live_wc/features/cart/domain/repositories/cart_repository.dart';

class CartUseCase implements UseCase<CartResponse, CartParam> {
  final CartRepository cartRepository;

  CartUseCase({required this.cartRepository});
  @override
  Future<Either<Failure, CartResponse>> call(CartParam param) async {
    return await cartRepository.addToCart(customerId: param.customerId);
  }
}

class CartParam {
  final int customerId;

  CartParam({required this.customerId});
}
