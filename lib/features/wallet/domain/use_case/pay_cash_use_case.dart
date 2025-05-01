import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/repositories/add_amount_repository.dart';

class PayCashUseCase implements UseCase<ApiResponseModel, PayCashParam> {
  final AddAmountRepository addAmountRepository;

  PayCashUseCase({required this.addAmountRepository});
  @override
  Future<Either<Failure, ApiResponseModel>> call(PayCashParam param) async {
    return await addAmountRepository.payCash(param: param);
  }
}

class PayCashParam {
  final String date;
  final String amount;
  final int customerId;

  PayCashParam(
      {required this.date, required this.amount, required this.customerId});
}
