import 'package:milk_ride_live_wc/features/wallet_history/domain/entities/billing_history_response.dart';
import 'package:milk_ride_live_wc/features/wallet_history/domain/entities/recharge_history_response.dart';
import 'package:milk_ride_live_wc/features/wallet_history/domain/use_case/billing_history_use_case.dart';
import 'package:milk_ride_live_wc/features/wallet_history/domain/use_case/recharge_history_use_case.dart';
import 'package:milk_ride_live_wc/services/api_service.dart';

abstract class HistoryRemoteRepo {
  Future<BillingHistoryResponse> billingHistory(
      {required BillingHistoryParam param});
  Future<RechargeHistoryResponse> rechargeHistory(
      {required RechargeHistoryParam param});
}

class HistoryImplRemoteRepo extends HistoryRemoteRepo {
  final ApiService apiService;
  HistoryImplRemoteRepo({required this.apiService});
  @override
  Future<BillingHistoryResponse> billingHistory(
      {required BillingHistoryParam param}) async {
    return await apiService.billingHistory(customerId: param.customerId);
  }

  @override
  Future<RechargeHistoryResponse> rechargeHistory(
      {required RechargeHistoryParam param}) async {
    return await apiService.rechargeHistory(customerId: param.customerId);
  }
}
