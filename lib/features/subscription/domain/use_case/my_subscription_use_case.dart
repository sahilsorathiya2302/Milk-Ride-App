import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/entities/subscription_response.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/repositories/subscription_repository.dart';

class SubscriptionUseCase
    implements UseCase<SubscriptionResponse, SubscriptionParam> {
  final SubscriptionRepository subscriptionRepository;

  SubscriptionUseCase({required this.subscriptionRepository});
  @override
  Future<Either<Failure, SubscriptionResponse>> call(
      SubscriptionParam param) async {
    return await subscriptionRepository.mySubscription(param: param);
  }
}

class SubscriptionParam {
  final int customerId;
  final int userId;

  SubscriptionParam({required this.customerId, required this.userId});
}
