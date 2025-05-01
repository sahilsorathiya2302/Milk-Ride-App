import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/utils/exception_handler.dart';
import 'package:milk_ride_live_wc/features/wallet/data/repositories/add_amount_impl_remote_repo.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/entities/pay_online_response.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/repositories/add_amount_repository.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/use_case/pay_cash_use_case.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/use_case/pay_online_use_case.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/use_case/verify_payment_use_case.dart';

class AddAmountImplRepository extends AddAmountRepository {
  final AddAmountRemoteRepo addAmountRemoteRepo;

  AddAmountImplRepository({required this.addAmountRemoteRepo});
  @override
  Future<Either<Failure, ApiResponseModel>> payCash(
      {required PayCashParam param}) async {
    try {
      final result = await addAmountRemoteRepo.payCash(param: param);
      return right(result);
    } on DioException catch (e) {
      return left(ExceptionHandler.handleError(error: e));
    }
  }

  @override
  Future<Either<Failure, PayOnlineResponse>> payOnline(
      {required PayOnlineParam param}) async {
    try {
      final result = await addAmountRemoteRepo.payOnline(param: param);
      return right(result);
    } on DioException catch (e) {
      return left(ExceptionHandler.handleError(error: e));
    }
  }

  @override
  Future<Either<Failure, ApiResponseModel>> verifyPayment(
      {required VerifyPaymentParam param}) async {
    try {
      final result = await addAmountRemoteRepo.verifyPayment(param: param);
      return right(result);
    } on DioException catch (e) {
      return left(ExceptionHandler.handleError(error: e));
    }
  }
}
