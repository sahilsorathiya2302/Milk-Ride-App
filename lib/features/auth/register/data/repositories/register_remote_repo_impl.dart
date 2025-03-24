import 'package:milk_ride_live_wc/features/auth/register/domain/entities/register_response.dart';
import 'package:milk_ride_live_wc/services/api_service.dart';

abstract interface class RegisterRemoteRepo {
  Future<RegisterResponse> userRegister(
    String name,
    String? email,
    String sourceId,
    String areaId,
    String houseNo,
    String? floor,
    String society,
    String landMark,
    String city,
    String area,
    String pinCode,
    String regionId,
    String userId,
    String? referrerCode,
    String? agentCode,
    String deliveryType,
    String gender,
    String mobileNumber,
  );
}

class RegisterRemoteRepoImpl implements RegisterRemoteRepo {
  final ApiService apiService;

  RegisterRemoteRepoImpl({required this.apiService});
  @override
  Future<RegisterResponse> userRegister(
    String name,
    String? email,
    String sourceId,
    String areaId,
    String houseNo,
    String? floor,
    String society,
    String landMark,
    String city,
    String area,
    String pinCode,
    String regionId,
    String userId,
    String? referrerCode,
    String? agentCode,
    String deliveryType,
    String gender,
    String mobileNumber,
  ) async {
    return await apiService.register(
      name,
      email,
      sourceId,
      areaId,
      houseNo,
      floor,
      society,
      landMark,
      city,
      area,
      pinCode,
      regionId,
      userId,
      referrerCode,
      agentCode,
      deliveryType,
      gender,
      mobileNumber,
    );
  }
}
