import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/features/side_menu/domain/use_case/vacation_use_case.dart';

abstract class VacationRepository {
  Future<Either<Failure, ApiResponseModel>> vacation(
      {required VacationParam param});
}
