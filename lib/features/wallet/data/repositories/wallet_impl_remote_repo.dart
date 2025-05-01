import 'package:milk_ride_live_wc/features/wallet/domain/entities/wallet_response.dart';
import 'package:milk_ride_live_wc/services/api_service.dart';

import '../../domain/use_case/wallet_use_case.dart';

abstract class WalletRemoteRepo {
  Future<WalletResponse> wallet({required WalletUseCaseParam param});
}

class WalletImplRemoteRepo extends WalletRemoteRepo {
  final ApiService apiService;

  WalletImplRemoteRepo({required this.apiService});
  @override
  Future<WalletResponse> wallet({required WalletUseCaseParam param}) async {
    return await apiService.wallet(
        userId: param.userId, customerId: param.customerId);
  }
}
