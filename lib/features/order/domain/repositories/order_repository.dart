import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/features/order/domain/entities/order_response.dart';
import 'package:milk_ride_live_wc/features/order/domain/use_case/order_cancel_use_case.dart';

import '../use_case/order_use_case.dart';

abstract class OrderRepository {
  Future<Either<Failure, OrderResponse>> orders({required OrderParam param});
  Future<Either<Failure, ApiResponseModel>> ordersCancel(
      {required OrderCancelParam param});
}
