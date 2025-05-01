import 'package:fpdart/src/either.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/entities/wallet_response.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/repositories/wallet_repository.dart';

class WalletUseCase implements UseCase<WalletResponse, WalletUseCaseParam> {
  final WalletRepository walletRepository;

  WalletUseCase({required this.walletRepository});
  @override
  Future<Either<Failure, WalletResponse>> call(WalletUseCaseParam param) async {
    return await walletRepository.wallet(param: param);
  }
}

class WalletUseCaseParam {
  final int userId;
  final int customerId;

  WalletUseCaseParam({required this.userId, required this.customerId});
}
