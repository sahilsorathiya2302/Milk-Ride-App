import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/utils/exception_handler.dart';
import 'package:milk_ride_live_wc/features/wallet_history/data/repositories/history_impl_remote_repo.dart';
import 'package:milk_ride_live_wc/features/wallet_history/domain/entities/billing_history_response.dart';
import 'package:milk_ride_live_wc/features/wallet_history/domain/entities/recharge_history_response.dart';
import 'package:milk_ride_live_wc/features/wallet_history/domain/repositories/history_repository.dart';
import 'package:milk_ride_live_wc/features/wallet_history/domain/use_case/billing_history_use_case.dart';
import 'package:milk_ride_live_wc/features/wallet_history/domain/use_case/recharge_history_use_case.dart';

class HistoryImplRepository extends HistoryRepository {
  final HistoryRemoteRepo historyRemoteRepo;

  HistoryImplRepository({required this.historyRemoteRepo});
  @override
  Future<Either<Failure, BillingHistoryResponse>> billingHistory(
      {required BillingHistoryParam param}) async {
    try {
      final result = await historyRemoteRepo.billingHistory(param: param);
      return right(result);
    } on DioException catch (e) {
      return left(ExceptionHandler.handleError(error: e));
    }
  }

  @override
  Future<Either<Failure, RechargeHistoryResponse>> rechargeHistory(
      {required RechargeHistoryParam param}) async {
    try {
      final result = await historyRemoteRepo.rechargeHistory(param: param);
      return right(result);
    } on DioException catch (e) {
      return left(ExceptionHandler.handleError(error: e));
    }
  }
}
