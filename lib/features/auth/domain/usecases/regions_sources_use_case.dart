import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/features/auth/domain/entities/sign_up_response.dart';
import 'package:milk_ride_live_wc/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/usecases/use_case.dart';

class RegionsSourcesUseCase
    implements UseCase<RegionsSourcesResponse, RegionsSourcesParam> {
  final AuthRepository authRepository;

  RegionsSourcesUseCase({required this.authRepository});
  @override
  Future<Either<Failure, RegionsSourcesResponse>> call(
      RegionsSourcesParam param) async {
    return await authRepository.fetchRegionsSources(
        mobileNumber: param.mobileNumber, userId: param.userId);
  }
}

class RegionsSourcesParam {
  final String mobileNumber;
  final int userId;

  RegionsSourcesParam({required this.mobileNumber, required this.userId});
}
