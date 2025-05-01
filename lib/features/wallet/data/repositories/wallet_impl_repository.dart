import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/utils/exception_handler.dart';
import 'package:milk_ride_live_wc/features/wallet/data/repositories/wallet_impl_remote_repo.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/entities/wallet_response.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/repositories/wallet_repository.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/use_case/wallet_use_case.dart';

class WalletImplRepository extends WalletRepository {
  final WalletRemoteRepo walletRemoteRepo;

  WalletImplRepository({required this.walletRemoteRepo});
  @override
  Future<Either<Failure, WalletResponse>> wallet(
      {required WalletUseCaseParam param}) async {
    try {
      final result = await walletRemoteRepo.wallet(param: param);
      return right(result);
    } on DioException catch (e) {
      return left(ExceptionHandler.handleError(error: e));
    }
  }
}
