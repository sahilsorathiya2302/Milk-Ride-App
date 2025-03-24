import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/features/auth/otp/data/repositories/otp_remote_repo_impl.dart';
import 'package:milk_ride_live_wc/features/auth/otp/domain/entities/otp_response.dart';
import 'package:milk_ride_live_wc/features/auth/otp/domain/repositories/otp_repository.dart';

class OtpRepositoryImpl extends OtpRepository {
  final OtpRemoteRepo otpRemoteRepo;

  OtpRepositoryImpl({required this.otpRemoteRepo});
  @override
  Future<Either<Failure, OtpResponse>> otpCheck(
      String mobileNumber, int userId, String otp) async {
    try {
      final response = await otpRemoteRepo.otpCheck(mobileNumber, userId, otp);
      return right(response);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
