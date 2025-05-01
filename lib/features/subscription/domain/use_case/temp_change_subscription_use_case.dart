import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/repositories/subscription_repository.dart';

class TempChangeSubscriptionUseCase
    implements UseCase<ApiResponseModel, TempChangeSubscriptionParam> {
  final SubscriptionRepository subscriptionRepository;

  TempChangeSubscriptionUseCase({required this.subscriptionRepository});
  @override
  Future<Either<Failure, ApiResponseModel>> call(
      TempChangeSubscriptionParam param) async {
    return await subscriptionRepository.tempSubscription(param: param);
  }
}

class TempChangeSubscriptionParam {
  final int subscriptionId;
  final String tempStartDate;
  final String tempEndDate;
  final int tempQty;

  TempChangeSubscriptionParam(
      {required this.subscriptionId,
      required this.tempStartDate,
      required this.tempEndDate,
      required this.tempQty});
}
