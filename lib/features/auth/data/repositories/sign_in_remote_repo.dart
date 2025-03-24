import 'package:milk_ride_live_wc/features/auth/sign_in/domain/entities/sign_in_response.dart';
import 'package:milk_ride_live_wc/services/api_service.dart';

abstract interface class SignInRemoteRepo {
  Future<SignInResponse> postSignInData(String mobileNumber, String userId);
}

class SignInRemoteRepoImpl implements SignInRemoteRepo {
  final ApiService apiService;

  SignInRemoteRepoImpl({required this.apiService});

  @override
  Future<SignInResponse> postSignInData(String mobileNumber, String userId) {
    return apiService.postSignInData(mobileNumber, userId);
  }
}
