import 'package:milk_ride_live_wc/features/profile/domain/entities/profile_response.dart';
import 'package:milk_ride_live_wc/features/profile/domain/use_case/profile_use_case.dart';
import 'package:milk_ride_live_wc/services/api_service.dart';

abstract class ProfileRemoteRepo {
  Future<ProfileResponse> profile({required ProfileParam param});
}

class ProfileImplRemoteRepo extends ProfileRemoteRepo {
  final ApiService apiService;

  ProfileImplRemoteRepo({required this.apiService});
  @override
  Future<ProfileResponse> profile({required ProfileParam param}) async {
    return await apiService.profile(
        customerId: param.customerId, userId: param.userId);
  }
}
