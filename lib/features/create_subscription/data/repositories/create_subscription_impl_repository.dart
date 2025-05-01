import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/features/create_subscription/data/repositories/create_subscription_impl_remote_repo.dart';
import 'package:milk_ride_live_wc/features/create_subscription/domain/repositories/create_subscription_repository.dart';
import 'package:milk_ride_live_wc/features/create_subscription/domain/usecase/create_subscription_use_case.dart';

class CreateSubscriptionImplRepository extends CreateSubscriptionRepository {
  final CreateSubscriptionRemoteRepo createSubscriptionRemoteRepo;

  CreateSubscriptionImplRepository(
      {required this.createSubscriptionRemoteRepo});

  @override
  Future<Either<Failure, ApiResponseModel>> subscriptionCreate(
      {required CreateSubscriptionParam param}) async {
    try {
      final result =
          await createSubscriptionRemoteRepo.subscriptionCreate(param: param);

      return right(result);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
