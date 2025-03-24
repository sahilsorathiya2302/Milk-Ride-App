import 'package:milk_ride_live_wc/features/auth/otp/domain/entities/otp_response.dart';
import 'package:milk_ride_live_wc/services/api_service.dart';

abstract interface class OtpRemoteRepo {
  Future<OtpResponse> otpCheck(String mobileNumber, int userId, String otp);
}

class OtpRemoteRepoImpl implements OtpRemoteRepo {
  final ApiService apiService;

  OtpRemoteRepoImpl({required this.apiService});
  @override
  Future<OtpResponse> otpCheck(
      String mobileNumber, int userId, String otp) async {
    return await apiService.checkOtp(mobileNumber, userId, otp);
  }
}
