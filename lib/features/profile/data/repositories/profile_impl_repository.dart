import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/utils/exception_handler.dart';
import 'package:milk_ride_live_wc/features/profile/data/repositories/profile_impl_remote_repo.dart';
import 'package:milk_ride_live_wc/features/profile/domain/entities/profile_response.dart';
import 'package:milk_ride_live_wc/features/profile/domain/repositories/profile_repository.dart';
import 'package:milk_ride_live_wc/features/profile/domain/use_case/profile_use_case.dart';

class ProfileImplRepository extends ProfileRepository {
  final ProfileRemoteRepo profileRemoteRepo;

  ProfileImplRepository({required this.profileRemoteRepo});
  @override
  Future<Either<Failure, ProfileResponse>> profile(
      {required ProfileParam param}) async {
    try {
      final result = await profileRemoteRepo.profile(param: param);

      return right(result);
    } on DioException catch (e) {
      return left(
        ExceptionHandler.handleError(error: e),
      );
    }
  }
}
