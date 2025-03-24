import 'package:fpdart/src/either.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';
import 'package:milk_ride_live_wc/features/auth/otp/domain/entities/resend_otp_response.dart';
import 'package:milk_ride_live_wc/features/auth/otp/domain/repositories/resend_otp_repository.dart';

class ResendOtpUseCase implements UseCase<ResendOtpResponse, ResendOtpParam> {
  final ResendOtpRepository resendOtpRepository;

  ResendOtpUseCase({required this.resendOtpRepository});
  @override
  Future<Either<Failure, ResendOtpResponse>> call(ResendOtpParam param) async {
    return await resendOtpRepository.resendOtp(
        param.mobileNumber, param.userId);
  }
}

class ResendOtpParam {
  final String mobileNumber;
  final int userId;

  ResendOtpParam({required this.mobileNumber, required this.userId});
}
