import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';
import 'package:milk_ride_live_wc/core/usecases/use_case.dart';
import 'package:milk_ride_live_wc/features/auth/domain/entities/area_response.dart';
import 'package:milk_ride_live_wc/features/auth/domain/repositories/auth_repository.dart';

class AreaUseCase implements UseCase<List<AreaResponse>, AreaParam> {
  final AuthRepository authRepository;

  AreaUseCase({required this.authRepository});

  @override
  Future<Either<Failure, List<AreaResponse>>> call(AreaParam param) async {
    return await authRepository.getArea(param: param);
  }
}

class AreaParam extends Equatable {
  final int id;

  const AreaParam({required this.id});

  @override
  List<Object> get props => [id];
}
