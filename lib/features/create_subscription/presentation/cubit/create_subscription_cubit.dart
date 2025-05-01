import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_button.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_dialog_box.dart';
import 'package:milk_ride_live_wc/core/utils/functional_component.dart';
import 'package:milk_ride_live_wc/features/create_subscription/domain/usecase/create_subscription_use_case.dart';
import 'package:milk_ride_live_wc/features/create_subscription/presentation/cubit/create_subscription_state.dart';
import 'package:milk_ride_live_wc/features/subscription/presentation/cubit/subscription/subscription_cubit.dart';

class CreateSubscriptionCubit extends Cubit<CreateSubscriptionState> {
  final CreateSubscriptionUseCase subscriptionUseCase;

  CreateSubscriptionCubit(this.subscriptionUseCase)
      : super(const CreateSubscriptionInitial());

  Future<void> addToCart({
    required int packageId,
    required int customerId,
    required int userId,
    required String frequencyType,
    required String? frequencyValue,
    required dynamic qty,
    required String? schedule,
    required int dayWiseQuantity,
    required String deliveryType,
    required String? startDate,
    required String? endDate,
    required int trialProduct,
    required int noOfUsages,
    required int productId,
  }) async {
    Get.context?.loaderOverlay.show();
    final result = await subscriptionUseCase.call(CreateSubscriptionParam(
      packageId: packageId,
      customerId: customerId,
      userId: userId,
      frequencyType: frequencyType,
      frequencyValue: frequencyValue ?? AppString.empty,
      qty: qty,
      schedule: schedule ?? AppString.empty,
      deliveryType: deliveryType,
      startDate: startDate ?? AppString.empty,
      endDate: endDate ?? AppString.empty,
      trialProduct: trialProduct,
      noOfUsages: noOfUsages,
      productId: productId,
      dayWiseQuantity: "",
    ));

    result.fold(
      (failure) {
        FunctionalComponent.errorSnackbar(message: failure.message);
      },
      (result) {
        if (result.status == AppString.success) {
          FunctionalComponent.successMessageSnackbar(message: result.message);
        } else if (result.status == AppString.error) {
          FunctionalComponent.errorSnackbar(message: result.message);
        }
      },
    );
    Get.context?.loaderOverlay.hide();
  }

  Future<void> subscriptionCreate({
    required int packageId,
    required int customerId,
    required int userId,
    required String frequencyType,
    required String frequencyValue,
    required dynamic qty,
    required String schedule,
    required String dayWiseQuantity,
    required String deliveryType,
    required String startDate,
    required String endDate,
    required int trialProduct,
    required int noOfUsages,
    required int productId,
  }) async {
    Get.context?.loaderOverlay.show();
    final result = await subscriptionUseCase.call(CreateSubscriptionParam(
      packageId: packageId,
      customerId: customerId,
      userId: userId,
      frequencyType: frequencyType,
      frequencyValue: frequencyValue,
      qty: qty,
      schedule: schedule,
      dayWiseQuantity: dayWiseQuantity,
      deliveryType: deliveryType,
      startDate: startDate,
      endDate: endDate,
      trialProduct: trialProduct,
      noOfUsages: noOfUsages,
      productId: productId,
    ));

    result.fold(
      (failure) {
        FunctionalComponent.errorSnackbar(message: failure.message);
      },
      (result) async {
        if (result.status == AppString.success) {
          showConfirmationDialog(
              title: AppString.createSubscription,
              subTitle: AppString.createSubscriptionMessage,
              widget: CustomButton(
                  onPressed: () {
                    Get.back();
                  },
                  text: AppString.ok));
          // FunctionalComponent.successMessageSnackbar(message: result.message);
          await Get.context
              ?.read<SubscriptionCubit>()
              .mySubscription(customerId: customerId, userId: userId);
        } else if (result.status == AppString.error) {
          FunctionalComponent.errorSnackbar(message: result.message);
        }
      },
    );
    Get.context?.loaderOverlay.hide();
  }

  void setLoading() {
    emit(CreateSubscriptionLoading(
      endDate: state.endDate,
      startDate: state.startDate,
      quantity: state.quantity,
      deliveryType: state.deliveryType,
      deliverySchedule: state.deliverySchedule,
      dayQuantities: state.dayQuantities,
      frequencyType: state.frequencyType,
      frequencyValue: state.frequencyValue,
      dayWiseQuantity: state.dayWiseQuantity,
    ));
  }

  void setLoaded(ApiResponseModel apiResponseModel) {
    emit(CreateSubscriptionLoaded(
      endDate: state.endDate,
      startDate: state.startDate,
      apiResponseModel: apiResponseModel,
      quantity: state.quantity,
      deliveryType: state.deliveryType,
      deliverySchedule: state.deliverySchedule,
      dayQuantities: state.dayQuantities,
      frequencyType: state.frequencyType,
      frequencyValue: state.frequencyValue,
      dayWiseQuantity: state.dayWiseQuantity,
    ));
  }

  void incrementQuantity() {
    _emitUpdatedQuantity(state.quantity + 1);
  }

  void decrementQuantity() {
    if (state.quantity > 1) {
      _emitUpdatedQuantity(state.quantity - 1);
    }
  }

  void setQuantity(int quantity) {
    _emitUpdatedQuantity(quantity);
  }

  void _emitUpdatedQuantity(int newQty) {
    if (state is CreateSubscriptionLoaded) {
      emit((state as CreateSubscriptionLoaded).copyWith(quantity: newQty));
    } else {
      emit(CreateSubscriptionLoading(
        endDate: state.endDate,
        startDate: state.startDate,
        quantity: newQty,
        deliveryType: state.deliveryType,
        deliverySchedule: state.deliverySchedule,
        dayQuantities: state.dayQuantities,
        frequencyType: state.frequencyType,
        frequencyValue: state.frequencyValue,
        dayWiseQuantity: state.dayWiseQuantity,
      ));
    }
  }

  void setStartDate(String startDate) {
    if (state is CreateSubscriptionLoaded) {
      emit((state as CreateSubscriptionLoaded).copyWith(startDate: startDate));
    } else {
      emit(CreateSubscriptionLoading(
        quantity: state.quantity,
        deliveryType: state.deliveryType,
        deliverySchedule: state.deliverySchedule,
        dayQuantities: state.dayQuantities,
        frequencyType: state.frequencyType,
        frequencyValue: state.frequencyValue,
        dayWiseQuantity: state.dayWiseQuantity,
        startDate: startDate,
        endDate: state.endDate,
      ));
    }

    setCurrent();
  }

  void setEndDate(String endDate) {
    if (state is CreateSubscriptionLoaded) {
      setCurrent();
      emit((state as CreateSubscriptionLoaded).copyWith(endDate: endDate));
    } else {
      emit(CreateSubscriptionLoading(
        quantity: state.quantity,
        deliveryType: state.deliveryType,
        deliverySchedule: state.deliverySchedule,
        dayQuantities: state.dayQuantities,
        frequencyType: state.frequencyType,
        frequencyValue: state.frequencyValue,
        dayWiseQuantity: state.dayWiseQuantity,
        startDate: state.startDate,
        endDate: endDate,
      ));
    }
  }

  void changeDeliveryType(String newType) {
    if (state is CreateSubscriptionLoaded) {
      emit((state as CreateSubscriptionLoaded).copyWith(deliveryType: newType));
    } else {
      emit(CreateSubscriptionLoading(
        endDate: state.endDate,
        startDate: state.startDate,
        quantity: state.quantity,
        deliveryType: newType,
        deliverySchedule: state.deliverySchedule,
        dayQuantities: state.dayQuantities,
        frequencyType: state.frequencyType,
        frequencyValue: state.frequencyValue,
        dayWiseQuantity: state.dayWiseQuantity,
      ));
    }
  }

  void changeDeliverySchedule(String schedule) {
    String frequencyType = AppString.empty;
    dynamic frequencyValue;

    List<int> dayWiseQuantity = [];

    switch (schedule) {
      case "Every Day":
        frequencyType = AppString.everyDay;
        frequencyValue = 1;

        break;

      case "Alternate Day":
        frequencyType = AppString.alternateDay;
        frequencyValue = 2;

        break;

      case "Every 3 Day":
        frequencyType = AppString.everyThreeDay;
        frequencyValue = 3;

        break;

      case "Day Wise":
        frequencyType = AppString.dayWiseSub;
        frequencyValue = 4;
        dayWiseQuantity = state.dayWiseQuantity;

        break;
    }

    if (state is CreateSubscriptionLoaded) {
      emit((state as CreateSubscriptionLoaded).copyWith(
        deliverySchedule: schedule,
        frequencyType: frequencyType,
        frequencyValue: frequencyValue,
        quantity: state.quantity,
        dayWiseQuantity: dayWiseQuantity,
      ));
    } else {
      emit(CreateSubscriptionLoading(
        endDate: state.endDate,
        startDate: state.startDate,
        quantity: state.quantity,
        deliveryType: state.deliveryType,
        deliverySchedule: schedule,
        dayQuantities: state.dayQuantities,
        frequencyType: frequencyType,
        frequencyValue: frequencyValue,
        dayWiseQuantity: dayWiseQuantity,
      ));
    }
  }

  void updateDayQuantity(int index, int quantity) {
    final updatedQuantities = List<int>.from(state.dayQuantities);
    updatedQuantities[index] = quantity;

    if (state is CreateSubscriptionLoaded) {
      emit((state as CreateSubscriptionLoaded)
          .copyWith(dayQuantities: updatedQuantities));
    } else {
      emit(CreateSubscriptionLoading(
        endDate: state.endDate,
        startDate: state.startDate,
        quantity: state.quantity,
        deliveryType: state.deliveryType,
        deliverySchedule: state.deliverySchedule,
        dayQuantities: updatedQuantities,
        frequencyType: state.frequencyType,
        frequencyValue: state.frequencyValue,
        dayWiseQuantity: state.dayWiseQuantity,
      ));
    }
  }

  void setCurrent() {
    if (state is CreateSubscriptionLoaded) {
      final currentState = state as CreateSubscriptionLoaded;
      emit(currentState.copyWith(
        startDate: currentState.startDate,
        endDate: currentState.endDate,
      ));
    } else if (state is CreateSubscriptionLoading) {
      final currentState = state;
      emit(CreateSubscriptionLoading(
        startDate: currentState.startDate,
        endDate: currentState.endDate,
        quantity: currentState.quantity,
        deliveryType: currentState.deliveryType,
        deliverySchedule: currentState.deliverySchedule,
        dayQuantities: currentState.dayQuantities,
        frequencyType: currentState.frequencyType,
        frequencyValue: currentState.frequencyValue,
        dayWiseQuantity: currentState.dayWiseQuantity,
      ));
    }
  }

  void resetState() {
    emit(const CreateSubscriptionInitial());
  }
}
