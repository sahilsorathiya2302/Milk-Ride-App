import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/features/auth/sign_in/domain/entities/sign_in_response.dart';
import 'package:milk_ride_live_wc/features/auth/sign_in/domain/repositories/sign_in_repository.dart';

import '../../../../../core/usecases/use_case.dart';

class SignInUseCase implements UseCase<SignInResponse, SignInParam> {
  final SignInRepository signInRepository;

  SignInUseCase({required this.signInRepository});
  @override
  Future<Either<Failure, SignInResponse>> call(SignInParam param) {
    return signInRepository.postSignInData(param.mobileNumber, param.userId);
  }
}

class SignInParam {
  final String mobileNumber;
  final String userId;

  SignInParam({required this.mobileNumber, required this.userId});
}
