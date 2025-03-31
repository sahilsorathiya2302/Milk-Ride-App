import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/features/home/data/repositories/home_remote_repo_impl.dart';
import 'package:milk_ride_live_wc/features/home/domain/entities/home_response.dart';
import 'package:milk_ride_live_wc/features/home/domain/repositories/home_repository.dart';
import 'package:milk_ride_live_wc/features/home/domain/usecese/home_use_case.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteRepo homeRemoteRepo;

  HomeRepositoryImpl({required this.homeRemoteRepo});

  @override
  Future<Either<Failure, HomeResponse>> getHomeData(HomeParam param) async {
    try {
      final result = await homeRemoteRepo.getHomeInfo(param);
      return right(result);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
