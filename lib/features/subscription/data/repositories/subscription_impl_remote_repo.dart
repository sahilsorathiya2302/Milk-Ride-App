import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/entities/subscription_response.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/use_case/delete_subscription_use_case.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/use_case/pause_subscription_use_case.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/use_case/resume_subscription_use_case.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/use_case/temp_change_subscription_use_case.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/use_case/update_permanent_use_case.dart';
import 'package:milk_ride_live_wc/services/api_service.dart';

import '../../domain/use_case/my_subscription_use_case.dart';

abstract class SubscriptionRemoteRepo {
  Future<SubscriptionResponse> mySubscription(
      {required SubscriptionParam param});

  Future<ApiResponseModel> deleteSubscription(
      {required DeleteSubscriptionParam param});
  Future<ApiResponseModel> tempChangeSubscription(
      {required TempChangeSubscriptionParam param});
  Future<ApiResponseModel> updatePermanent(
      {required UpdatePermanentParam param});
  Future<ApiResponseModel> pauseSubscription(
      {required PauseSubscriptionParam param});
  Future<ApiResponseModel> resumeSubscription(
      {required ResumeSubscriptionParam param});
}

class SubscriptionImplRemoteRepo extends SubscriptionRemoteRepo {
  final ApiService apiService;

  SubscriptionImplRemoteRepo({required this.apiService});
  @override
  Future<SubscriptionResponse> mySubscription(
      {required SubscriptionParam param}) async {
    return await apiService.mySubscription(
        customerId: param.customerId, userId: param.userId);
  }

  @override
  Future<ApiResponseModel> deleteSubscription(
      {required DeleteSubscriptionParam param}) async {
    return await apiService.deleteSubscription(
        subscriptionId: param.subscriptionId);
  }

  @override
  Future<ApiResponseModel> tempChangeSubscription(
      {required TempChangeSubscriptionParam param}) async {
    return await apiService.temporaryChangeSubscription(
        subscriptionId: param.subscriptionId,
        tempStartDate: param.tempStartDate,
        tempEndDate: param.tempEndDate,
        tempQty: param.tempQty);
  }

  @override
  Future<ApiResponseModel> updatePermanent(
      {required UpdatePermanentParam param}) async {
    return await apiService.updatePermanentSubscription(
        subscriptionId: param.subscriptionId,
        frequencyValue: param.frequencyType,
        qty: param.qty);
  }

  @override
  Future<ApiResponseModel> pauseSubscription(
      {required PauseSubscriptionParam param}) async {
    return await apiService.pauseSubscription(
        subscriptionId: param.subscriptionId,
        pauseStartDate: param.pauseStartDate,
        pauseEndDate: param.pauseEndDate);
  }

  @override
  Future<ApiResponseModel> resumeSubscription(
      {required ResumeSubscriptionParam param}) async {
    return await apiService.resumeSubscription(
        subscriptionId: param.subscriptionId, customerId: param.customerId);
  }
}
