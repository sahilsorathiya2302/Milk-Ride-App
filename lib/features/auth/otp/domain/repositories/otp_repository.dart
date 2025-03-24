import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/features/auth/otp/domain/entities/otp_response.dart';

abstract class OtpRepository {
  Future<Either<Failure, OtpResponse>> otpCheck(
      String mobileNumber, int userId, String otp);
}
