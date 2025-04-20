import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';
import 'package:milk_ride_live_wc/features/auth/domain/entities/area_response.dart';
import 'package:milk_ride_live_wc/features/auth/domain/entities/otp_response.dart';
import 'package:milk_ride_live_wc/features/auth/domain/entities/register_response.dart';
import 'package:milk_ride_live_wc/features/auth/domain/entities/sign_in_response.dart';
import 'package:milk_ride_live_wc/features/auth/domain/entities/sign_up_response.dart';
import 'package:milk_ride_live_wc/features/auth/domain/usecases/register_use_case.dart';

import '../../../../services/api_service.dart';

abstract class AuthRemoteRepo {
  Future<List<AreaResponse>> getArea({required int id});
  Future<OtpResponse> otpCheck(
      {required String mobileNumber, required int userId, required String otp});

  Future<RegionsSourcesResponse> fetchRegionsAndSources(
      {required String mobileNumber, required int userId});

  Future<RegisterResponse> userRegister({required RegisterParam param});

  Future<ApiResponseModel> resendOtp(
      {required String mobileNumber, required int userId});

  Future<SignInResponse> postSignInData(
      {required String mobileNumber, required String userId});
}

class AuthImplRemoteRepo extends AuthRemoteRepo {
  final ApiService apiService;

  AuthImplRemoteRepo({required this.apiService});
  @override
  Future<RegionsSourcesResponse> fetchRegionsAndSources(
      {required String mobileNumber, required int userId}) async {
    return await apiService.fetchRegionsSourceData(
        mobileNumber: mobileNumber, userId: userId);
  }

  @override
  Future<List<AreaResponse>> getArea({required int id}) async {
    return await apiService.getAreas(id: id);
  }

  @override
  Future<OtpResponse> otpCheck(
      {required String mobileNumber,
      required int userId,
      required String otp}) async {
    return await apiService.checkOtp(
        mobileNumber: mobileNumber, userId: userId, otp: otp);
  }

  @override
  Future<SignInResponse> postSignInData(
      {required String mobileNumber, required String userId}) {
    return apiService.postSignInData(
        mobileNumber: mobileNumber, userId: userId);
  }

  @override
  Future<ApiResponseModel> resendOtp(
      {required String mobileNumber, required int userId}) async {
    return await apiService.resendOtp(
        mobileNumber: mobileNumber, userId: userId);
  }

  @override
  Future<RegisterResponse> userRegister({required RegisterParam param}) async {
    return await apiService.register(
      email: param.email,
      sourceId: param.sourceId,
      areaId: param.areaId,
      houseNo: param.houseNo,
      floor: param.floor,
      society: param.society,
      landMark: param.landMark,
      city: param.city,
      area: param.area,
      pinCode: param.pinCode,
      regionId: param.regionId,
      userId: param.userId,
      referrerCode: param.referrerCode,
      agentCode: param.agentCode,
      deliveryType: param.deliveryType,
      gender: param.gender,
      mobileNumber: param.mobileNumber,
      name: param.name,
    );
  }
}
