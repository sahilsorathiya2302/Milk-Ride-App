import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';
import 'package:milk_ride_live_wc/features/side_menu/domain/use_case/vacation_use_case.dart';
import 'package:milk_ride_live_wc/services/api_service.dart';

abstract class VacationRemoteRepo {
  Future<ApiResponseModel> vacation({required VacationParam param});
}

class VacationImplRemoteRepo extends VacationRemoteRepo {
  final ApiService apiService;

  VacationImplRemoteRepo({required this.apiService});
  @override
  Future<ApiResponseModel> vacation({required VacationParam param}) async {
    return await apiService.vacationMode(
        customerId: param.customerId, status: param.status);
  }
}
