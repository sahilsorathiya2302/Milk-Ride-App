import 'package:fpdart/src/either.dart';
import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';
import 'package:milk_ride_live_wc/features/cart/domain/repositories/place_order_repository.dart';

class PlaceOrderUseCase implements UseCase<ApiResponseModel, PlaceOrderParam> {
  final PlaceOrderRepository placeOrderRepository;

  PlaceOrderUseCase({required this.placeOrderRepository});

  @override
  Future<Either<Failure, ApiResponseModel>> call(PlaceOrderParam param) async {
    return await placeOrderRepository.placeOrder(param: param);
  }
}

class PlaceOrderParam {
  final int userId;
  final int customerId;

  PlaceOrderParam({required this.userId, required this.customerId});
}
