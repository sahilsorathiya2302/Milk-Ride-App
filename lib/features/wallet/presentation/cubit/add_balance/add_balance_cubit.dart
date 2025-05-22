import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/storage/storage_keys.dart';
import 'package:milk_ride_live_wc/core/storage/storage_manager.dart';
import 'package:milk_ride_live_wc/core/utils/functional_component.dart';
import 'package:milk_ride_live_wc/features/home/presentation/cubit/home_cubit.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/entities/pay_online_data.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/use_case/pay_cash_use_case.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/use_case/pay_online_use_case.dart';
import 'package:milk_ride_live_wc/features/wallet/domain/use_case/verify_payment_use_case.dart';
import 'package:milk_ride_live_wc/features/wallet/presentation/cubit/wallet/wallet_cubit.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'add_balance_state.dart';

class AddBalanceCubit extends Cubit<AddBalanceState> {
  final PayCashUseCase payCashUseCase;
  final PayOnlineUseCase payOnlineUseCase;
  final VerifyPaymentUseCase verifyPaymentUseCase;
  late Razorpay _razorpay;

  AddBalanceCubit({
    required this.payCashUseCase,
    required this.payOnlineUseCase,
    required this.verifyPaymentUseCase,
  }) : super(const AddBalanceState()) {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
  }

  PayOnlineData? payOnlineData;
  Future<void> payCash({
    required int customerId,
    required String amount,
    required String date,
  }) async {
    Get.context?.loaderOverlay.show();
    final result = await payCashUseCase.call(
      PayCashParam(date: date, amount: amount, customerId: customerId),
    );

    result.fold(
      (failure) {
        emit(AddBalanceError(errorMessage: failure.message));
      },
      (result) {
        if (result.status == AppString.success) {
          FunctionalComponent.successMessageSnackbar(
            message: result.message ?? AppString.empty,
          );
        } else if (result.status == AppString.error) {
          FunctionalComponent.errorMessageSnackbar(
            message: result.message ?? AppString.empty,
          );
        }
      },
    );
    Get.context?.loaderOverlay.hide();
  }

  Future<void> verifyPayment(
      {required String transactionId,
      required String orderId,
      required int customerId}) async {
    Get.context?.loaderOverlay.show();
    final result = await verifyPaymentUseCase.call(VerifyPaymentParam(
        transactionId: transactionId,
        orderId: orderId,
        customerId: customerId));

    result.fold(
      (failure) {
        emit(AddBalanceError(errorMessage: failure.message));
      },
      (result) async {
        if (result.status == AppString.success) {
          debugPrint("Hello");
          Get.context?.loaderOverlay.hide();
          FunctionalComponent.successMessageSnackbar(
              message: result.message ?? AppString.empty);

          await Get.context?.read<WalletCubit>().wallet();
          await Get.context?.read<HomeCubit>().getHome();
        } else if (result.status == AppString.error) {
          Get.context?.loaderOverlay.hide();
          FunctionalComponent.errorMessageSnackbar(
              message: result.message ?? AppString.empty);
        }
      },
    );
    Get.context?.loaderOverlay.hide();
  }

  Future<void> payOnline(
      {required String amount,
      required String mobileNumber,
      required int customerId,
      required String name}) async {
    Get.context?.loaderOverlay.show();
    final result = await payOnlineUseCase
        .call(PayOnlineParam(amount: amount, customerId: customerId));
    result.fold(
      (failure) {
        emit(AddBalanceError(errorMessage: failure.message));
      },
      (result) {
        if (result.status == AppString.success) {
          payOnlineData = result.data;
          var options = {
            'key': 'rzp_test_VQ3WeSiPCBSFjg',
            'amount': int.parse(amount) * 100,
            'name': name,
            'description': 'Add balance to wallet',
            'prefill': {
              'contact': mobileNumber,
              'email': 'example@mail.com',
            },
            'external': {
              'wallets': ['paytm', 'phonepe']
            }
          };

          try {
            Get.context?.loaderOverlay.hide();
            _razorpay.open(options);
          } catch (e) {
            FunctionalComponent.errorMessageSnackbar(
                message: 'Error opening Razorpay: $e');
          }
        }
      },
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    final customerId = StorageManager.readData(StorageKeys.customerId);
    final orderId = Get.context?.read<AddBalanceCubit>().payOnlineData?.orderId;

    await verifyPayment(
        transactionId: response.paymentId ?? AppString.empty,
        orderId: orderId ?? "",
        customerId: customerId);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    FunctionalComponent.errorMessageSnackbar(
        message: 'Payment Failed: ${response.message}');
  }

  @override
  Future<void> close() {
    _razorpay.clear();
    return super.close();
  }

  void resetState() {
    emit(const AddBalanceState());
  }

  void selectMethod(String method) {
    emit(state.copyWith(selectedMethod: method));
  }

  void selectDate(String date) {
    emit(state.copyWith(selectDate: date));
  }

  void setCurrentAmount(String amount) {
    emit(state.copyWith(amount: amount));
  }

  void amount(String amount) {
    setCurrentAmount(amount);
  }
}
