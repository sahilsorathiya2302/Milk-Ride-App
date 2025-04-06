import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/features/home/domain/entities/home_response.dart';
import 'package:milk_ride_live_wc/features/home/domain/repositories/home_repository.dart';
import 'package:milk_ride_live_wc/features/home/domain/usecese/home_use_case.dart';

import 'home_remote_repo_impl.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteRepo homeRemoteRepo;

  HomeRepositoryImpl({required this.homeRemoteRepo});

  @override
  Future<Either<Failure, HomeResponse>> getHomeData(HomeParam param) async {
    try {
      final result = await homeRemoteRepo.getHomeInfo(param);
      return right(result);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return left(NetworkFailure("No Internet Connection"));
      }
      return left(ServerFailure(message: e.message ?? "Unknown Server Error"));
    } catch (e) {
      return left(UnexpectedFailure("Something went wrong"));
    }
  }
}
