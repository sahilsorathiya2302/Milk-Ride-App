import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/features/auth/sign_up/domain/entities/sign_up_response.dart';

abstract class SignUpRepository {
  Future<Either<Failure, SignUpResponse>> postSignUpData(
      String mobileNumber, int userId);
}
