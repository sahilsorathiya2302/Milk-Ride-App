import 'package:milk_ride_live_wc/features/home/domain/entities/home_response.dart';
import 'package:milk_ride_live_wc/features/home/domain/usecese/home_use_case.dart';
import 'package:milk_ride_live_wc/services/api_service.dart';

abstract class HomeRemoteRepo {
  Future<HomeResponse> getHomeInfo(HomeParam param);
}

class HomeRemoteRepoImpl extends HomeRemoteRepo {
  final ApiService apiService;

  HomeRemoteRepoImpl({required this.apiService});

  @override
  Future<HomeResponse> getHomeInfo(HomeParam param) async {
    return await apiService.getHomeData(
        mobileNumber: param.mobileNumber,
        userId: param.userId,
        type: param.type,
        deviceType: param.deviceType,
        devicesModel: param.devicesModel,
        version: param.version,
        devicesId: param.devicesId);
  }
}
