import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/features/home/domain/entities/home_response.dart';
import 'package:milk_ride_live_wc/features/home/domain/usecese/home_use_case.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeResponse>> getHomeData(HomeParam param);
}
