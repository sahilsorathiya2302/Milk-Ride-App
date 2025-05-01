import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';

import '../repositories/order_repository.dart';

class OrderCancelUseCase
    implements UseCase<ApiResponseModel, OrderCancelParam> {
  final OrderRepository orderRepository;

  OrderCancelUseCase({required this.orderRepository});
  @override
  Future<Either<Failure, ApiResponseModel>> call(OrderCancelParam param) async {
    return await orderRepository.ordersCancel(param: param);
  }
}

class OrderCancelParam {
  final int orderId;
  final int packageId;
  final int? reasonId;

  OrderCancelParam(
      {required this.orderId, required this.packageId, required this.reasonId});
}
