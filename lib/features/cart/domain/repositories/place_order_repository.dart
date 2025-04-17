import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/features/cart/domain/usecase/place_order_use_case.dart';

abstract class PlaceOrderRepository {
  Future<Either<Failure, ApiResponseModel>> placeOrder(
      {required PlaceOrderParam param});
}
