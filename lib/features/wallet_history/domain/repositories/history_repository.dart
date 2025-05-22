import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/features/wallet_history/domain/entities/recharge_history_response.dart';
import 'package:milk_ride_live_wc/features/wallet_history/domain/use_case/billing_history_use_case.dart';
import 'package:milk_ride_live_wc/features/wallet_history/domain/use_case/recharge_history_use_case.dart';

import '../entities/billing_history_response.dart';

abstract class HistoryRepository {
  Future<Either<Failure, BillingHistoryResponse>> billingHistory(
      {required BillingHistoryParam param});

  Future<Either<Failure, RechargeHistoryResponse>> rechargeHistory(
      {required RechargeHistoryParam param});
}
