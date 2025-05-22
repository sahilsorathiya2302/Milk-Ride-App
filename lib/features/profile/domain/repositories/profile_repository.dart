import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/features/profile/domain/entities/profile_response.dart';

import '../use_case/profile_use_case.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileResponse>> profile(
      {required ProfileParam param});
}
