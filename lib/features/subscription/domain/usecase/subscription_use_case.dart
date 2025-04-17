import 'package:fpdart/src/either.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/repositories/subscription_repository.dart';

class SubscriptionUseCase implements UseCase {
  final SubscriptionRepository subscriptionRepository;

  SubscriptionUseCase({required this.subscriptionRepository});
  @override
  Future<Either<Failure, dynamic>> call(param) {
    return subscriptionRepository.subscriptionCreate(param: param);
  }
}

class SubscriptionParam {
  final int packageId;
  final int customerId;
  final int userId;
  final String frequencyType;
  final dynamic frequencyValue;
  final int qty;
  final String schedule;
  final List<int> dayWiseQuantity;
  final String deliveryType;
  final String startDate;
  final String endDate;
  final int trialProduct;
  final int noOfUsages;
  final int productId;

  SubscriptionParam(
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
