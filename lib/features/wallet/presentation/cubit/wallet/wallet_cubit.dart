import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/utils/functional_component.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/entities/wallet_data.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/use_case/wallet_use_case.dart';
import 'package:milk_ride_live_wc/features/wallet/presentation/cubit/wallet/wallet_state.dart';

import '../../../../../core/storage/storage_keys.dart';
import '../../../../../core/storage/storage_manager.dart';

class WalletCubit extends Cubit<WalletState> {
  final WalletUseCase walletUseCase;
  WalletCubit({required this.walletUseCase}) : super(WalletInitial());

  WalletData? walletData;
  Future<void> wallet() async {
    final userId = StorageManager.readData(StorageKeys.userId);
    final customerId = StorageManager.readData(StorageKeys.customerId);
    final result = await walletUseCase
        .call(WalletUseCaseParam(userId: userId, customerId: customerId));

    result.fold(
      (failure) {
        return emit(WalletError(errorMessage: failure.message));
      },
      (result) {
        emit(WalletLoading());
        if (result.status == AppString.success) {
          walletData = result.data;
          emit(WalletLoaded(walletResponse: result));
        } else if (result.status == AppString.error) {
          FunctionalComponent.errorMessageSnackbar(
              message: result.message.toString());
        }
      },
    );
  }
}
