import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/utils/exception_handler.dart';
import 'package:milk_ride_live_wc/features/cart/data/repositories/place_order_impl_remote_repo.dart';
import 'package:milk_ride_live_wc/features/cart/domain/repositories/place_order_repository.dart';
import 'package:milk_ride_live_wc/features/cart/domain/usecase/place_order_use_case.dart';

class PlaceOrderImplRepository extends PlaceOrderRepository {
  final PlaceOrderRemoteRepo placeOrderRemoteRepo;

  PlaceOrderImplRepository({required this.placeOrderRemoteRepo});
  @override
  Future<Either<Failure, ApiResponseModel>> placeOrder(
      {required PlaceOrderParam param}) async {
    try {
      final result = await placeOrderRemoteRepo.placeOrder(param: param);
      return right(result);
    } on DioException catch (e) {
      return left(ExceptionHandler.handleError(error: e));
    }
  }
}
