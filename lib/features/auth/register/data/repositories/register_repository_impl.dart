import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/features/auth/register/data/repositories/register_remote_repo_impl.dart';
import 'package:milk_ride_live_wc/features/auth/register/domain/entities/register_response.dart';
import 'package:milk_ride_live_wc/features/auth/register/domain/repositories/register_repository.dart';

class RegisterRepositoryImpl extends RegisterRepository {
  final RegisterRemoteRepo registerRemoteRepo;

  RegisterRepositoryImpl({required this.registerRemoteRepo});
  @override
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
  ) async {
    try {
      final response = await registerRemoteRepo.userRegister(
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
          mobileNumber);
      return right(response);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
