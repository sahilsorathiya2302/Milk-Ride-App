import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';
import 'package:milk_ride_live_wc/features/wallet_history/domain/entities/billing_history_response.dart';
import 'package:milk_ride_live_wc/features/wallet_history/domain/repositories/history_repository.dart';

class BillingHistoryUseCase
    implements UseCase<BillingHistoryResponse, BillingHistoryParam> {
  final HistoryRepository historyRepository;

  BillingHistoryUseCase({required this.historyRepository});
  @override
  Future<Either<Failure, BillingHistoryResponse>> call(
      BillingHistoryParam param) async {
    return await historyRepository.billingHistory(param: param);
  }
}

class BillingHistoryParam {
  final int customerId;

  BillingHistoryParam({required this.customerId});
}
