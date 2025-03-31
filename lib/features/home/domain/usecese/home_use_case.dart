import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';
import 'package:milk_ride_live_wc/features/home/domain/entities/home_response.dart';
import 'package:milk_ride_live_wc/features/home/domain/repositories/home_repository.dart';

class HomeUseCase implements UseCase<HomeResponse, HomeParam> {
  final HomeRepository homeRepository;

  HomeUseCase({required this.homeRepository});

  @override
  Future<Either<Failure, HomeResponse>> call(HomeParam param) async {
    return await homeRepository.getHomeData(param);
  }
}

class HomeParam {
  final String mobileNumber;
  final int userId;
  final String type;
  final String deviceType;
  final String devicesModel;
  final String version;
  final String devicesId;

  HomeParam(
      {required this.mobileNumber,
      required this.userId,
      required this.type,
      required this.deviceType,
      required this.devicesModel,
      required this.version,
      required this.devicesId});
}
