import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/entities/wallet_response.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/use_case/wallet_use_case.dart';

abstract class WalletRepository {
  Future<Either<Failure, WalletResponse>> wallet(
      {required WalletUseCaseParam param});
}
