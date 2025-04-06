import 'package:flutter_bloc/flutter_bloc.dart';

import 'delivery_type_state.dart';

class DeliveryTypeCubit extends Cubit<DeliveryTypeState> {
  DeliveryTypeCubit() : super(DeliveryTypeInitial());

  void selectDeliveryType(String type) {
    emit(DeliveryTypeUpdated(deliveryType: type));
  }
}
