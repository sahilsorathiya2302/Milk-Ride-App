import 'package:fpdart/src/either.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/entities/pay_online_response.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/repositories/add_amount_repository.dart';

class PayOnlineUseCase implements UseCase<PayOnlineResponse, PayOnlineParam> {
  final AddAmountRepository addAmountRepository;

  PayOnlineUseCase({required this.addAmountRepository});
  @override
  Future<Either<Failure, PayOnlineResponse>> call(PayOnlineParam param) async {
    return await addAmountRepository.payOnline(param: param);
  }
}

class PayOnlineParam {
  final String amount;
  final int customerId;

  PayOnlineParam({required this.amount, required this.customerId});
}
