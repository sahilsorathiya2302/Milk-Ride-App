import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/repositories/subscription_repository.dart';

class UpdatePermanentUseCase
    implements UseCase<ApiResponseModel, UpdatePermanentParam> {
  final SubscriptionRepository subscriptionRepository;

  UpdatePermanentUseCase({required this.subscriptionRepository});
  @override
  Future<Either<Failure, ApiResponseModel>> call(
      UpdatePermanentParam param) async {
    return await subscriptionRepository.updatePermanent(param: param);
  }
}

class UpdatePermanentParam {
  final int subscriptionId;
  final String frequencyType;
  final int qty;

  UpdatePermanentParam(
      {required this.subscriptionId,
      required this.frequencyType,
      required this.qty});
}
