import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/features/auth/domain/entities/sign_in_response.dart';
import 'package:milk_ride_live_wc/features/auth/domain/repositories/auth_repository.dart';

import '../../../../../core/usecases/use_case.dart';

class SignInUseCase implements UseCase<SignInResponse, SignInParam> {
  final AuthRepository authRepository;

  SignInUseCase({required this.authRepository});
  @override
  Future<Either<Failure, SignInResponse>> call(SignInParam param) {
    return authRepository.postSignInData(
        mobileNumber: param.mobileNumber, userId: param.userId);
  }
}

class SignInParam {
  final String mobileNumber;
  final String userId;

  SignInParam({required this.mobileNumber, required this.userId});
}
