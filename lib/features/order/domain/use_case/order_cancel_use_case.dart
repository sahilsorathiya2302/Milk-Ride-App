import 'package:fpdart/src/either.dart';
import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';
import 'package:milk_ride_live_wc/features/order/data/repositories/order_impl_repository.dart';

class OrderCancelUseCase
    implements UseCase<ApiResponseModel, OrderCancelParam> {
  final OrderImplRepository orderImplRepository;

  OrderCancelUseCase({required this.orderImplRepository});
  @override
  Future<Either<Failure, ApiResponseModel>> call(OrderCancelParam param) async {
    return await orderImplRepository.ordersCancel(param: param);
  }
}

class OrderCancelParam {
  final int orderId;
  final int packageId;
  final int? reasonId;

  OrderCancelParam(
      {required this.orderId, required this.packageId, required this.reasonId});
}
