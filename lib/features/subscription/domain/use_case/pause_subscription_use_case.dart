import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/repositories/subscription_repository.dart';

class PauseSubscriptionUseCase
    implements UseCase<ApiResponseModel, PauseSubscriptionParam> {
  final SubscriptionRepository subscriptionRepository;

  PauseSubscriptionUseCase({required this.subscriptionRepository});

  @override
  Future<Either<Failure, ApiResponseModel>> call(
      PauseSubscriptionParam param) async {
    return await subscriptionRepository.pauseSubscription(param: param);
  }
}

class PauseSubscriptionParam {
  final int subscriptionId;
  final String pauseStartDate;
  final String pauseEndDate;

  PauseSubscriptionParam(
      {required this.subscriptionId,
      required this.pauseStartDate,
      required this.pauseEndDate});
}
