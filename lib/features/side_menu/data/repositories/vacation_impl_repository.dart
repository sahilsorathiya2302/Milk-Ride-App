import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/utils/exception_handler.dart';
import 'package:milk_ride_live_wc/features/side_menu/data/repositories/vacation_impl_remote_repo.dart';
import 'package:milk_ride_live_wc/features/side_menu/domain/repositories/vacation_repository.dart';
import 'package:milk_ride_live_wc/features/side_menu/domain/use_case/vacation_use_case.dart';

class VacationImplRepository extends VacationRepository {
  final VacationRemoteRepo vacationRemoteRepo;

  VacationImplRepository({required this.vacationRemoteRepo});
  @override
  Future<Either<Failure, ApiResponseModel>> vacation(
      {required VacationParam param}) async {
    try {
      final result = await vacationRemoteRepo.vacation(param: param);
      return right(result);
    } on DioException catch (e) {
      return left(ExceptionHandler.handleError(error: e));
    }
  }
}
