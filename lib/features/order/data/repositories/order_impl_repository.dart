import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/utils/exception_handler.dart';
import 'package:milk_ride_live_wc/features/order/data/repositories/order_impl_remote_repo.dart';
import 'package:milk_ride_live_wc/features/order/domain/entities/order_response.dart';
import 'package:milk_ride_live_wc/features/order/domain/repositories/order_repository.dart';
import 'package:milk_ride_live_wc/features/order/domain/use_case/order_cancel_use_case.dart';
import 'package:milk_ride_live_wc/features/order/domain/use_case/order_use_case.dart';

class OrderImplRepository extends OrderRepository {
  final OrderRemoteRepo orderRemoteRepo;

  OrderImplRepository({required this.orderRemoteRepo});
  @override
  Future<Either<Failure, OrderResponse>> orders(
      {required OrderParam param}) async {
    try {
      final result = await orderRemoteRepo.order(param: param);
      return right(result);
    } on DioException catch (e) {
      return left(ExceptionHandler.handleError(error: e));
    }
  }

  @override
  Future<Either<Failure, ApiResponseModel>> ordersCancel(
      {required OrderCancelParam param}) async {
    try {
      final result = await orderRemoteRepo.orderCancel(param: param);
      return right(result);
    } on DioException catch (e) {
      return left(ExceptionHandler.handleError(error: e));
    }
  }
}
