import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/utils/exception_handler.dart';
import 'package:milk_ride_live_wc/features/subscription/data/repositories/subscription_impl_remote_repo.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/entities/subscription_response.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/repositories/subscription_repository.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/use_case/delete_subscription_use_case.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/use_case/my_subscription_use_case.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/use_case/pause_subscription_use_case.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/use_case/resume_subscription_use_case.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/use_case/temp_change_subscription_use_case.dart';
import 'package:milk_ride_live_wc/features/subscription/domain/use_case/update_permanent_use_case.dart';

class SubscriptionImplRepository extends SubscriptionRepository {
  final SubscriptionRemoteRepo subscriptionRemoteRepo;

  SubscriptionImplRepository({required this.subscriptionRemoteRepo});
  @override
  Future<Either<Failure, SubscriptionResponse>> mySubscription(
      {required SubscriptionParam param}) async {
    try {
      final result = await subscriptionRemoteRepo.mySubscription(param: param);
      return right(result);
    } on DioException catch (e) {
      return left(ExceptionHandler.handleError(error: e));
    }
  }

  @override
  Future<Either<Failure, ApiResponseModel>> deleteSubscription(
      {required DeleteSubscriptionParam param}) async {
    try {
      final result =
          await subscriptionRemoteRepo.deleteSubscription(param: param);
      return right(result);
    } on DioException catch (e) {
      return left(ExceptionHandler.handleError(error: e));
    }
  }

  @override
  Future<Either<Failure, ApiResponseModel>> tempSubscription(
      {required TempChangeSubscriptionParam param}) async {
    try {
      final result =
          await subscriptionRemoteRepo.tempChangeSubscription(param: param);
      return right(result);
    } on DioException catch (e) {
      return left(ExceptionHandler.handleError(error: e));
    }
  }

  @override
  Future<Either<Failure, ApiResponseModel>> updatePermanent(
      {required UpdatePermanentParam param}) async {
    try {
      final result = await subscriptionRemoteRepo.updatePermanent(param: param);
      return right(result);
    } on DioException catch (e) {
      return left(ExceptionHandler.handleError(error: e));
    }
  }

  @override
  Future<Either<Failure, ApiResponseModel>> pauseSubscription(
      {required PauseSubscriptionParam param}) async {
    try {
      final result =
          await subscriptionRemoteRepo.pauseSubscription(param: param);
      return right(result);
    } on DioException catch (e) {
      return left(ExceptionHandler.handleError(error: e));
    }
  }

  @override
  Future<Either<Failure, ApiResponseModel>> resumeSubscription(
      {required ResumeSubscriptionParam param}) async {
    try {
      final result =
          await subscriptionRemoteRepo.resumeSubscription(param: param);
      return right(result);
    } on DioException catch (e) {
      return left(ExceptionHandler.handleError(error: e));
    }
  }
}
