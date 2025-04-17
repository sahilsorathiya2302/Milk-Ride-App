import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';
import 'package:milk_ride_live_wc/features/order/domain/entities/order_response.dart';
import 'package:milk_ride_live_wc/features/order/domain/use_case/order_cancel_use_case.dart';
import 'package:milk_ride_live_wc/features/order/domain/use_case/order_use_case.dart';
import 'package:milk_ride_live_wc/services/api_service.dart';

abstract class OrderRemoteRepo {
  Future<OrderResponse> order({required OrderParam param});
  Future<ApiResponseModel> orderCancel({required OrderCancelParam param});
}

class OrderImplRemoteRepo extends OrderRemoteRepo {
  final ApiService apiService;

  OrderImplRemoteRepo({required this.apiService});
  @override
  Future<OrderResponse> order({required OrderParam param}) async {
    return await apiService.orders(
        deliveryDate: param.deliveryDate, customerId: param.customerId);
  }

  @override
  Future<ApiResponseModel> orderCancel(
      {required OrderCancelParam param}) async {
    return await apiService.cancelOrder(
        orderId: param.orderId,
        packageId: param.packageId,
        reasonId: param.reasonId);
  }
}
