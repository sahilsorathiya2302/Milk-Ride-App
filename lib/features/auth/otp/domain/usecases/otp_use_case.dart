import 'package:fpdart/src/either.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';
import 'package:milk_ride_live_wc/features/auth/otp/domain/entities/otp_response.dart';
import 'package:milk_ride_live_wc/features/auth/otp/domain/repositories/otp_repository.dart';

class OtpUseCase implements UseCase<OtpResponse, OtpParam> {
  final OtpRepository otpRepository;

  OtpUseCase({required this.otpRepository});
  @override
  Future<Either<Failure, OtpResponse>> call(OtpParam param) async {
    return await otpRepository.otpCheck(
        param.mobileNumber, param.userId, param.otp);
  }
}

class OtpParam {
  final String mobileNumber;
  final int userId;
  final String otp;

  OtpParam(
      {required this.mobileNumber, required this.userId, required this.otp});
}
