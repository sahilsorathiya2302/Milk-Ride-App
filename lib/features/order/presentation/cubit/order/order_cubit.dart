import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milk_ride_live_wc/core/constants/app_string.dart';
import 'package:milk_ride_live_wc/core/utils/functional_component.dart';
import 'package:milk_ride_live_wc/features/order/domain/entities/order_data.dart';
import 'package:milk_ride_live_wc/features/order/domain/entities/order_response.dart';
import 'package:milk_ride_live_wc/features/order/domain/use_case/order_use_case.dart';
import 'package:milk_ride_live_wc/features/order/presentation/cubit/order/order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderUseCase orderUseCase;

  OrderCubit({required this.orderUseCase})
      : super(OrderInitial(
          baseDate: DateTime.now(),
          selectedDate: DateTime.now(),
          index: 0,
          cancelReason: AppString.empty,
          reasonId: 39,
        ));

  OrderData? orderData;
  OrderResponse? orderDetails;

  Future<void> order({
    required String deliveryDate,
    required int customerId,
  }) async {
    emit(OrderLoadingState(
      baseDate: state.baseDate,
      selectedDate: state.selectedDate,
      index: state.index,
      cancelReason: state.cancelReason,
      reasonId: state.reasonId,
    ));

    final result = await orderUseCase.call(
      OrderParam(deliveryDate: deliveryDate, customerId: customerId),
    );

    result.fold(
      (failure) {
        emit(OrderErrorState(
          baseDate: state.baseDate,
          selectedDate: state.selectedDate,
          index: state.index,
          cancelReason: state.cancelReason,
          errorMessage: failure.message,
          reasonId: state.reasonId,
        ));
      },
      (result) {
        if (result.status == AppString.success) {
          orderData = result.data;
          orderDetails = result;

          emit(OrderLoadedState(
            cancelReason: state.cancelReason,
            baseDate: state.baseDate,
            selectedDate: state.selectedDate,
            index: state.index,
            reasonId: state.reasonId,
            orderResponse: result,
          ));
        } else if (result.status == AppString.error) {
          FunctionalComponent.errorMessageSnackbar(
              message: result.message ?? "");
        }
      },
    );
  }

  void changeBaseDate(DateTime newDate) {
    emit(state.copyWith(baseDate: newDate, selectedDate: newDate));
  }

  void selectDate(DateTime date) {
    emit(state.copyWith(
      selectedDate: date,
      baseDate: date,
    ));
  }

  void selectedStatus(int index) {
    if (state is OrderLoadedState) {
      emit((state as OrderLoadedState).copyWith(index: index));
    }
  }

  void selectReason(String cancelReason, int id) {
    if (state is OrderLoadedState) {
      emit(state.copyWith(cancelReason: cancelReason, reasonId: id));
    }
  }

  void setCurrent() {
    final now = DateTime.now();
    emit(state.copyWith(
      baseDate: now,
      selectedDate: now,
      index: state.index,
      cancelReason: state.cancelReason,
    ));
  }
}
