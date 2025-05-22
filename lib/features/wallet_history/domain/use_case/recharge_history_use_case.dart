import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';
import 'package:milk_ride_live_wc/features/wallet_history/domain/entities/recharge_history_response.dart';
import 'package:milk_ride_live_wc/features/wallet_history/domain/repositories/history_repository.dart';

class RechargeHistoryUseCase
    implements UseCase<RechargeHistoryResponse, RechargeHistoryParam> {
  final HistoryRepository historyRepository;

  RechargeHistoryUseCase({required this.historyRepository});
  @override
  Future<Either<Failure, RechargeHistoryResponse>> call(
      RechargeHistoryParam param) async {
    return await historyRepository.rechargeHistory(param: param);
  }
}

class RechargeHistoryParam {
  final int customerId;

  RechargeHistoryParam({required this.customerId});
}
