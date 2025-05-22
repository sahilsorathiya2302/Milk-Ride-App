import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';
import 'package:milk_ride_live_wc/features/side_menu/domain/repositories/vacation_repository.dart';

class VacationUseCase implements UseCase<ApiResponseModel, VacationParam> {
  final VacationRepository vacationRepository;

  VacationUseCase({required this.vacationRepository});
  @override
  Future<Either<Failure, ApiResponseModel>> call(VacationParam param) async {
    return await vacationRepository.vacation(param: param);
  }
}

class VacationParam {
  final int customerId;
  final int status;

  VacationParam({required this.customerId, required this.status});
}
