import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';
import 'package:milk_ride_live_wc/features/auth/register/domain/entities/register_response.dart';
import 'package:milk_ride_live_wc/features/auth/register/domain/repositories/register_repository.dart';

class RegisterUseCase implements UseCase<RegisterResponse, RegisterParam> {
  final RegisterRepository registerRepository;

  RegisterUseCase({required this.registerRepository});
  @override
  Future<Either<Failure, RegisterResponse>> call(RegisterParam param) async {
    return await registerRepository.register(
        param.name,
        param.email,
        param.sourceId,
        param.areaId,
        param.houseNo,
        param.floor,
        param.society,
        param.landMark,
        param.city,
        param.area,
        param.pinCode,
        param.regionId,
        param.userId,
        param.referrerCode,
        param.agentCode,
        param.deliveryType,
        param.gender,
        param.mobileNumber);
  }
}
