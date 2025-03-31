import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';
import 'package:milk_ride_live_wc/features/auth/domain/entities/otp_response.dart';
import 'package:milk_ride_live_wc/features/auth/domain/repositories/auth_repository.dart';

class OtpUseCase implements UseCase<OtpResponse, OtpParam> {
  final AuthRepository authRepository;

  OtpUseCase({required this.authRepository});
  @override
  Future<Either<Failure, OtpResponse>> call(OtpParam param) async {
    return await authRepository.otpCheck(
        mobileNumber: param.mobileNumber, userId: param.userId, otp: param.otp);
  }
}

class OtpParam {
  final String mobileNumber;
  final int userId;
  final String otp;

  OtpParam(
      {required this.mobileNumber, required this.userId, required this.otp});
}
