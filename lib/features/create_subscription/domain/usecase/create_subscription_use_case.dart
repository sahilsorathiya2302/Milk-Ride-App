import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';
import 'package:milk_ride_live_wc/features/create_subscription/domain/repositories/create_subscription_repository.dart';

class CreateSubscriptionUseCase implements UseCase {
  final CreateSubscriptionRepository createSubscriptionRepository;

  CreateSubscriptionUseCase({required this.createSubscriptionRepository});
  @override
  Future<Either<Failure, dynamic>> call(param) {
    return createSubscriptionRepository.subscriptionCreate(param: param);
  }
}

class CreateSubscriptionParam {
  final int packageId;
  final int customerId;
  final int userId;
  final String frequencyType;
  final dynamic frequencyValue;
  final dynamic qty;
  final String schedule;
  final String dayWiseQuantity;
  final String deliveryType;
  final String startDate;
  final String endDate;
  final int trialProduct;
  final int noOfUsages;
  final int productId;

  CreateSubscriptionParam(
      {required this.packageId,
      required this.customerId,
      required this.userId,
      required this.frequencyType,
      required this.frequencyValue,
      required this.qty,
      required this.schedule,
      required this.dayWiseQuantity,
      required this.deliveryType,
      required this.startDate,
      required this.endDate,
      required this.trialProduct,
      required this.noOfUsages,
      required this.productId});
}
