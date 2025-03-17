import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';

abstract interface class UseCase<SuccessType, Param> {
  Future<Either<Failure, SuccessType>> call(Param param);
}

class SignUpParam {
  final String mobileNumber;
  final int userId;

  SignUpParam({required this.mobileNumber, required this.userId});
}

class NoParam {}
