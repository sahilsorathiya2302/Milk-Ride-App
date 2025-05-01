import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';
import 'package:milk_ride_live_wc/features/order/domain/entities/order_response.dart';
import 'package:milk_ride_live_wc/features/order/domain/repositories/order_repository.dart';

class OrderUseCase implements UseCase<OrderResponse, OrderParam> {
  final OrderRepository orderRepository;

  OrderUseCase({required this.orderRepository});
  @override
  Future<Either<Failure, OrderResponse>> call(OrderParam param) async {
    return await orderRepository.orders(param: param);
  }
}

class OrderParam {
  final String deliveryDate;
  final int customerId;

  OrderParam({required this.deliveryDate, required this.customerId});
}
