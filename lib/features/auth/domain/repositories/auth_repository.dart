import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/features/auth/domain/usecases/area_use_case.dart';
import 'package:milk_ride_live_wc/features/auth/domain/usecases/register_use_case.dart';

import '../../../../core/common_model/api_response_model.dart';
import '../entities/area_response.dart';
import '../entities/otp_response.dart';
import '../entities/register_response.dart';
import '../entities/sign_in_response.dart';
import '../entities/sign_up_response.dart';

abstract class AuthRepository {
  Future<Either<Failure, List<AreaResponse>>> getArea(
      {required AreaParam param});
  Future<Either<Failure, OtpResponse>> otpCheck(
      {required String mobileNumber, required int userId, required String otp});
  Future<Either<Failure, RegionsSourcesResponse>> fetchRegionsSources(
      {required String mobileNumber, required int userId});
  Future<Either<Failure, ApiResponseModel>> resendOtp(
      {required String mobileNumber, required int userId});

  Future<Either<Failure, RegisterResponse>> register(
      {required RegisterParam param});
  Future<Either<Failure, SignInResponse>> postSignInData(
      {required String mobileNumber, required String userId});
}
