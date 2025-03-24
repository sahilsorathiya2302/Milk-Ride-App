import 'package:milk_ride_live_wc/features/auth/sign_up/domain/entities/sign_up_response.dart';
import 'package:milk_ride_live_wc/services/api_service.dart';

abstract class SignUpRemoteRepo {
  Future<SignUpResponse> postSignUpData(String mobileNumber, int userId);
}

class SignUpRemoteRepoImpl extends SignUpRemoteRepo {
  final ApiService apiService;

  SignUpRemoteRepoImpl({required this.apiService});

  @override
  Future<SignUpResponse> postSignUpData(String mobileNumber, int userId) async {
    return await apiService.postSignUpData(mobileNumber, userId);
  }
}
