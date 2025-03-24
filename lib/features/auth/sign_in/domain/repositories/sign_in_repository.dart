import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/features/auth/sign_in/domain/entities/sign_in_response.dart';

abstract class SignInRepository {
  Future<Either<Failure, SignInResponse>> postSignInData(
      String mobileNumber, String userId);
}
