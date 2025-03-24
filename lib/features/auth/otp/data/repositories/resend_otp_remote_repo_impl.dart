import 'package:milk_ride_live_wc/features/auth/otp/domain/entities/resend_otp_response.dart';
import 'package:milk_ride_live_wc/services/api_service.dart';

abstract class ResendOtpRemoteRepo {
  Future<ResendOtpResponse> resendOtp(String mobileNumber, int userId);
}

class ResendOtpRemoteRepoImpl extends ResendOtpRemoteRepo {
  final ApiService apiService;

  ResendOtpRemoteRepoImpl({required this.apiService});
  @override
  Future<ResendOtpResponse> resendOtp(String mobileNumber, int userId) async {
    return await apiService.resendOtp(mobileNumber, userId);
  }
}
