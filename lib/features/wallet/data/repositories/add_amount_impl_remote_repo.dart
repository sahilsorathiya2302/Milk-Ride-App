import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/entities/pay_online_response.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/use_case/pay_cash_use_case.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/use_case/pay_online_use_case.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/use_case/verify_payment_use_case.dart';
import 'package:milk_ride_live_wc/services/api_service.dart';

abstract class AddAmountRemoteRepo {
  Future<ApiResponseModel> payCash({required PayCashParam param});
  Future<PayOnlineResponse> payOnline({required PayOnlineParam param});
  Future<ApiResponseModel> verifyPayment({required VerifyPaymentParam param});
}

class AddAmountImplRemoteRepo extends AddAmountRemoteRepo {
  final ApiService apiService;

  AddAmountImplRemoteRepo({required this.apiService});
  @override
  Future<ApiResponseModel> payCash({required PayCashParam param}) async {
    return await apiService.payCash(
        customerId: param.customerId, amount: param.amount, date: param.date);
  }

  @override
  Future<PayOnlineResponse> payOnline({required PayOnlineParam param}) async {
    return await apiService.payOnline(
        amount: param.amount, customerId: param.customerId);
  }

  @override
  Future<ApiResponseModel> verifyPayment(
      {required VerifyPaymentParam param}) async {
    return await apiService.verifyPayment(
        transactionId: param.transactionId,
        orderId: param.orderId,
        customerId: param.customerId);
  }
}
