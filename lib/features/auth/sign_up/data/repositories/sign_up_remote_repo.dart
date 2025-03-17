import 'package:milk_ride_live_wc/features/auth/sign_up/domain/entities/sign_up_response.dart';
import 'package:milk_ride_live_wc/services/auth_api_service.dart';

abstract class SignUpRemoteRepo {
  Future<SignUpResponse> postSignUpData(String mobileNumber, int userId);
}

class SignUpRemoteRepoImpl extends SignUpRemoteRepo {
  final AuthApiService authApiService;

  SignUpRemoteRepoImpl({required this.authApiService});

  @override
  Future<SignUpResponse> postSignUpData(String mobileNumber, int userId) async {
    return await authApiService.postSignUpData(mobileNumber, userId);
  }
}
