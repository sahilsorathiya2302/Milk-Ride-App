import 'package:fpdart/src/either.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/features/auth/sign_up/data/repositories/sign_up_remote_repo.dart';
import 'package:milk_ride_live_wc/features/auth/sign_up/domain/entities/sign_up_response.dart';
import 'package:milk_ride_live_wc/features/auth/sign_up/domain/repositories/sign_up_repository.dart';

class SignUpRepositoryImpl extends SignUpRepository {
  final SignUpRemoteRepo signUpRemoteRepo;

  SignUpRepositoryImpl({required this.signUpRemoteRepo});
  @override
  Future<Either<Failure, SignUpResponse>> postSignUpData(
      String mobileNumber, int userId) async {
    try {
      final response =
          await signUpRemoteRepo.postSignUpData(mobileNumber, userId);
      print("=========================>${response.statusCode}");
      return right(response);
    } catch (e) {
      print("=========================>${e.toString()}");
      return left(Failure(message: e.toString()));
    }
  }
}
