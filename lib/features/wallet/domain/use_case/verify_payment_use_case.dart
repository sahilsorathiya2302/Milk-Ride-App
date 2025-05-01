import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/repositories/add_amount_repository.dart';

class VerifyPaymentUseCase
    implements UseCase<ApiResponseModel, VerifyPaymentParam> {
  final AddAmountRepository addAmountRepository;

  VerifyPaymentUseCase({required this.addAmountRepository});
  @override
  Future<Either<Failure, ApiResponseModel>> call(
      VerifyPaymentParam param) async {
    return await addAmountRepository.verifyPayment(param: param);
  }
}

class VerifyPaymentParam {
  final String transactionId;
  final String orderId;
  final int customerId;

  VerifyPaymentParam(
      {required this.transactionId,
      required this.orderId,
      required this.customerId});
}
