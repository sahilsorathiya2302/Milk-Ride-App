import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';
import 'package:milk_ride_live_wc/features/profile/domain/entities/profile_response.dart';
import 'package:milk_ride_live_wc/features/profile/domain/repositories/profile_repository.dart';

class ProfileUseCase implements UseCase<ProfileResponse, ProfileParam> {
  final ProfileRepository profileRepository;

  ProfileUseCase({required this.profileRepository});
  @override
  Future<Either<Failure, ProfileResponse>> call(ProfileParam param) async {
    return await profileRepository.profile(param: param);
  }
}

class ProfileParam {
  final int customerId;
  final int userId;

  ProfileParam({required this.customerId, required this.userId});
}
