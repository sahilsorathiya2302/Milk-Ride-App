import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/features/auth/otp/domain/entities/resend_otp_response.dart';

abstract class ResendOtpRepository {
  Future<Either<Failure, ResendOtpResponse>> resendOtp(
      String mobileNumber, int userId);
}
