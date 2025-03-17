import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';
import 'package:milk_ride_live_wc/features/auth/sign_up/domain/entities/sign_up_response.dart';
import 'package:milk_ride_live_wc/features/auth/sign_up/domain/repositories/sign_up_repository.dart';

class PostSignUpUseCase implements UseCase<SignUpResponse, SignUpParam> {
  final SignUpRepository signUpRepository;

  PostSignUpUseCase({required this.signUpRepository});
  @override
  Future<Either<Failure, SignUpResponse>> call(SignUpParam param) {
    return signUpRepository.postSignUpData(param.mobileNumber, param.userId);
  }
}
