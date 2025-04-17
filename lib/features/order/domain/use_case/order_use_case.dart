import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';
import 'package:milk_ride_live_wc/features/order/data/repositories/order_impl_repository.dart';
import 'package:milk_ride_live_wc/features/order/domain/entities/order_response.dart';

class OrderUseCase implements UseCase<OrderResponse, OrderParam> {
  final OrderImplRepository orderImplRepository;

  OrderUseCase({required this.orderImplRepository});
  @override
  Future<Either<Failure, OrderResponse>> call(OrderParam param) async {
    return await orderImplRepository.orders(param: param);
  }
}

class OrderParam {
  final String deliveryDate;
  final int customerId;

  OrderParam({required this.deliveryDate, required this.customerId});
}
