import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/storage/storage_keys.dart';
import 'package:milk_ride_live_wc/core/storage/storage_manager.dart';
import 'package:milk_ride_live_wc/core/utils/functional_component.dart';
import 'package:milk_ride_live_wc/features/profile/domain/use_case/profile_use_case.dart';
import 'package:milk_ride_live_wc/features/profile/presentation/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileUseCase profileUseCase;
  ProfileCubit({required this.profileUseCase}) : super(ProfileInitial());

  Future<void> profile() async {
    final customerId = StorageManager.readData(StorageKeys.customerId);
    final userId = StorageManager.readData(StorageKeys.userId);
    final result = await profileUseCase
        .call(ProfileParam(customerId: customerId, userId: userId));

    result.fold(
      (failure) {
        emit(ProfileError(errorMessage: failure.message));
      },
      (result) {
        if (result.status == AppString.success) {
          emit(ProfileLoaded(profileResponse: result));
        } else if (result.status == AppString.error) {
          FunctionalComponent.errorMessageSnackbar(
              message: result.message ?? AppString.empty);
        }
      },
    );
  }
}
