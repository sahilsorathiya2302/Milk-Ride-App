import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/entities/pay_online_response.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/use_case/pay_cash_use_case.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/use_case/pay_online_use_case.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/use_case/verify_payment_use_case.dart';

abstract class AddAmountRepository {
  Future<Either<Failure, ApiResponseModel>> payCash(
      {required PayCashParam param});

  Future<Either<Failure, PayOnlineResponse>> payOnline(
      {required PayOnlineParam param});

  Future<Either<Failure, ApiResponseModel>> verifyPayment(
      {required VerifyPaymentParam param});
}
