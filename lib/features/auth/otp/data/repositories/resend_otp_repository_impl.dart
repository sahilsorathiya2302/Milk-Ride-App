import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/features/auth/otp/data/repositories/resend_otp_remote_repo_impl.dart';
import 'package:milk_ride_live_wc/features/auth/otp/domain/entities/resend_otp_response.dart';
import 'package:milk_ride_live_wc/features/auth/otp/domain/repositories/resend_otp_repository.dart';

class ResendOtpRepositoryImpl extends ResendOtpRepository {
  final ResendOtpRemoteRepo resendOtpRemoteRepo;

  ResendOtpRepositoryImpl({required this.resendOtpRemoteRepo});
  @override
  Future<Either<Failure, ResendOtpResponse>> resendOtp(
      String mobileNumber, int userId) async {
    try {
      final response =
          await resendOtpRemoteRepo.resendOtp(mobileNumber, userId);
      return right(response);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
