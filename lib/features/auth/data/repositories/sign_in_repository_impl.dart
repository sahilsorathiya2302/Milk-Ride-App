import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/features/auth/data/repositories/sign_in_remote_repo.dart';
import 'package:milk_ride_live_wc/features/auth/sign_in/domain/entities/sign_in_response.dart';
import 'package:milk_ride_live_wc/features/auth/sign_in/domain/repositories/sign_in_repository.dart';

class SignInRepositoryImpl extends SignInRepository {
  final SignInRemoteRepo signInRemoteRepo;

  SignInRepositoryImpl({required this.signInRemoteRepo});

  @override
  Future<Either<Failure, SignInResponse>> postSignInData(
      String mobileNumber, String userId) async {
    try {
      final response =
          await signInRemoteRepo.postSignInData(mobileNumber, userId);
      return right(response);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
