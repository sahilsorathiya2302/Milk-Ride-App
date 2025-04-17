import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';
import 'package:milk_ride_live_wc/features/cart/domain/usecase/place_order_use_case.dart';
import 'package:milk_ride_live_wc/services/api_service.dart';

abstract class PlaceOrderRemoteRepo {
  Future<ApiResponseModel> placeOrder({required PlaceOrderParam param});
}

class PlaceOrderImplRemoteRepo extends PlaceOrderRemoteRepo {
  final ApiService apiService;

  PlaceOrderImplRemoteRepo({required this.apiService});
  @override
  Future<ApiResponseModel> placeOrder({required PlaceOrderParam param}) {
    return apiService.placeOrder(
        userId: param.userId, customerId: param.customerId);
  }
}
