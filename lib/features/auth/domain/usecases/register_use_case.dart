import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';
import 'package:milk_ride_live_wc/features/auth/domain/entities/register_response.dart';
import 'package:milk_ride_live_wc/features/auth/domain/repositories/auth_repository.dart';

class RegisterUseCase implements UseCase<RegisterResponse, RegisterParam> {
  final AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});
  @override
  Future<Either<Failure, RegisterResponse>> call(RegisterParam param) async {
    return await authRepository.register(param: param);
  }
}

class RegisterParam {
  final String name;

  final String? email;
  final String sourceId;
  final String areaId;
  final String houseNo;
  final String? floor;
  final String society;
  final String landMark;
  final String city;
  final String area;
  final String pinCode;
  final String regionId;
  final int userId;
  final String? referrerCode;
  final String? agentCode;
  final String deliveryType;
  final String gender;
  final String mobileNumber;

  RegisterParam(
      {required this.name,
      required this.email,
      required this.sourceId,
      required this.areaId,
      required this.houseNo,
      required this.floor,
      required this.society,
      required this.landMark,
      required this.city,
      required this.area,
      required this.pinCode,
      required this.regionId,
      required this.userId,
      required this.referrerCode,
      required this.agentCode,
      required this.deliveryType,
      required this.gender,
      required this.mobileNumber});
}
