import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/features/auth/register/domain/entities/register_response.dart';

abstract class RegisterRepository {
  Future<Either<Failure, RegisterResponse>> register(
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
