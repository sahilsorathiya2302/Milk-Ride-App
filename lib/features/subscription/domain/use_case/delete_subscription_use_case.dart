import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';

import '../repositories/subscription_repository.dart';

class DeleteSubscriptionUseCase
    implements UseCase<ApiResponseModel, DeleteSubscriptionParam> {
  final SubscriptionRepository subscriptionRepository;

  DeleteSubscriptionUseCase({required this.subscriptionRepository});
  @override
  Future<Either<Failure, ApiResponseModel>> call(
      DeleteSubscriptionParam param) async {
    return await subscriptionRepository.deleteSubscription(param: param);
  }
}

class DeleteSubscriptionParam {
  final int subscriptionId;

  DeleteSubscriptionParam({required this.subscriptionId});
}
