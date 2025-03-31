import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';
import 'package:milk_ride_live_wc/features/auth/domain/repositories/auth_repository.dart';

class ResendOtpUseCase implements UseCase<ApiResponseModel, ResendOtpParam> {
  final AuthRepository authRepository;

  ResendOtpUseCase({required this.authRepository});
  @override
  Future<Either<Failure, ApiResponseModel>> call(ResendOtpParam param) async {
    return await authRepository.resendOtp(
        mobileNumber: param.mobileNumber, userId: param.userId);
  }
}

class ResendOtpParam {
  final String mobileNumber;
  final int userId;

  ResendOtpParam({required this.mobileNumber, required this.userId});
}
