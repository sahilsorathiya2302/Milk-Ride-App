import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/entities/subscription_response.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/use_case/delete_subscription_use_case.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/use_case/my_subscription_use_case.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/use_case/pause_subscription_use_case.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/use_case/resume_subscription_use_case.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/use_case/temp_change_subscription_use_case.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/use_case/update_permanent_use_case.dart';

abstract class SubscriptionRepository {
  Future<Either<Failure, SubscriptionResponse>> mySubscription(
      {required SubscriptionParam param});

  Future<Either<Failure, ApiResponseModel>> deleteSubscription(
      {required DeleteSubscriptionParam param});

  Future<Either<Failure, ApiResponseModel>> tempSubscription(
      {required TempChangeSubscriptionParam param});

  Future<Either<Failure, ApiResponseModel>> updatePermanent(
      {required UpdatePermanentParam param});

  Future<Either<Failure, ApiResponseModel>> pauseSubscription(
      {required PauseSubscriptionParam param});
  Future<Either<Failure, ApiResponseModel>> resumeSubscription(
      {required ResumeSubscriptionParam param});
}
