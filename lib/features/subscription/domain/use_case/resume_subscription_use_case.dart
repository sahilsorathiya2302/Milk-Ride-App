import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/repositories/subscription_repository.dart';

class ResumeSubscriptionUseCase
    implements UseCase<ApiResponseModel, ResumeSubscriptionParam> {
  final SubscriptionRepository subscriptionRepository;

  ResumeSubscriptionUseCase({required this.subscriptionRepository});
  @override
  Future<Either<Failure, ApiResponseModel>> call(
      ResumeSubscriptionParam param) async {
    return await subscriptionRepository.resumeSubscription(param: param);
  }
}

class ResumeSubscriptionParam {
  final int subscriptionId;
  final int customerId;

  ResumeSubscriptionParam(
      {required this.subscriptionId, required this.customerId});
}
