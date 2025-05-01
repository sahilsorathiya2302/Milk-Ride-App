import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';
import 'package:milk_ride_live_wc/features/create_subscription/domain/usecase/create_subscription_use_case.dart';
import 'package:milk_ride_live_wc/services/api_service.dart';

abstract class CreateSubscriptionRemoteRepo {
  Future<ApiResponseModel> subscriptionCreate(
      {required CreateSubscriptionParam param});
}

class CreateSubscriptionImplRemoteRepo extends CreateSubscriptionRemoteRepo {
  final ApiService apiService;

  CreateSubscriptionImplRemoteRepo({required this.apiService});
  @override
  Future<ApiResponseModel> subscriptionCreate(
      {required CreateSubscriptionParam param}) async {
    return await apiService.createSubscription(
        packageId: param.packageId,
        customerId: param.customerId,
        userId: param.userId,
        frequencyType: param.frequencyType,
        frequencyValue: param.frequencyValue,
        quantity: param.qty,
        schedule: param.schedule,
        dayWiseQuantity: param.dayWiseQuantity,
        deliveryType: param.deliveryType,
        startDate: param.startDate,
        endDate: param.endDate,
        trialProduct: param.trialProduct,
        noOfUsages: param.noOfUsages,
        productId: param.productId);
  }
}
