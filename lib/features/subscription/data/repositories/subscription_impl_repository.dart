import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/features/subscription/data/repositories/subscription_impl_remote_repo.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/repositories/subscription_repository.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/usecase/subscription_use_case.dart';

class SubscriptionImplRepository extends SubscriptionRepository {
  final SubscriptionRemoteRepo subscriptionRemoteRepo;

  SubscriptionImplRepository({required this.subscriptionRemoteRepo});

  @override
  Future<Either<Failure, ApiResponseModel>> subscriptionCreate(
      {required SubscriptionParam param}) async {
    try {
      final result =
          await subscriptionRemoteRepo.subscriptionCreate(param: param);

      return right(result);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
