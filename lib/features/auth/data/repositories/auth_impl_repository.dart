import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/utils/exception_handler.dart';
import 'package:milk_ride_live_wc/features/auth/data/repositories/auth_impl_remote_repo.dart';
import 'package:milk_ride_live_wc/features/auth/domain/entities/area_response.dart';
import 'package:milk_ride_live_wc/features/auth/domain/entities/otp_response.dart';
import 'package:milk_ride_live_wc/features/auth/domain/entities/register_response.dart';
import 'package:milk_ride_live_wc/features/auth/domain/entities/sign_in_response.dart';
import 'package:milk_ride_live_wc/features/auth/domain/entities/sign_up_response.dart';
import 'package:milk_ride_live_wc/features/auth/domain/repositories/auth_repository.dart';
import 'package:milk_ride_live_wc/features/auth/domain/usecases/area_use_case.dart';
import 'package:milk_ride_live_wc/features/auth/domain/usecases/register_use_case.dart';

import '../../../../core/common_model/api_response_model.dart';

class AuthImplRepository extends AuthRepository {
  final AuthRemoteRepo authRemoteRepo;

  AuthImplRepository({required this.authRemoteRepo});
  @override
  Future<Either<Failure, RegionsSourcesResponse>> fetchRegionsSources(
      {required String mobileNumber, required int userId}) async {
    try {
      final result = await authRemoteRepo.fetchRegionsAndSources(
          mobileNumber: mobileNumber, userId: userId);
      return right(result);
    } on DioException catch (e) {
      return left(ExceptionHandler.handleError(error: e));
    }
  }

  @override
  Future<Either<Failure, List<AreaResponse>>> getArea(
      {required AreaParam param}) async {
    try {
      final result = await authRemoteRepo.getArea(id: param.id);

      return right(result);
    } on DioException catch (e) {
      return left(ExceptionHandler.handleError(error: e));
    }
  }

  @override
  Future<Either<Failure, OtpResponse>> otpCheck(
      {required String mobileNumber,
      required int userId,
      required String otp}) async {
    try {
      final response = await authRemoteRepo.otpCheck(
          mobileNumber: mobileNumber, userId: userId, otp: otp);
      return right(response);
    } on DioException catch (e) {
      return left(ExceptionHandler.handleError(error: e));
    }
  }

  @override
  Future<Either<Failure, SignInResponse>> postSignInData(
      {required String mobileNumber, required String userId}) async {
    try {
      final response = await authRemoteRepo.postSignInData(
          mobileNumber: mobileNumber, userId: userId);
      return right(response);
    } on DioException catch (e) {
      return left(ExceptionHandler.handleError(error: e));
    }
  }

  @override
  Future<Either<Failure, RegisterResponse>> register(
      {required RegisterParam param}) async {
    try {
      final response = await authRemoteRepo.userRegister(param: param);
      return right(response);
    } on DioException catch (e) {
      return left(ExceptionHandler.handleError(error: e));
    }
  }

  @override
  Future<Either<Failure, ApiResponseModel>> resendOtp(
      {required String mobileNumber, required int userId}) async {
    try {
      final response = await authRemoteRepo.resendOtp(
          mobileNumber: mobileNumber, userId: userId);
      return right(response);
    } on DioException catch (e) {
      return left(ExceptionHandler.handleError(error: e));
    }
  }
}
