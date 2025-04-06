import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProductQuantityController extends GetxController {
  RxInt quantity = 1.obs;

  void setQuantity(int value) {
    quantity.value = value;
  }

  void increment(int max) {
    if (quantity.value < max) {
      quantity.value++;
    }
  }

  void decrement(int min) {
    if (quantity.value > min) {
      quantity.value--;
    }
  }

  void resetToInitialQuantity(int value) {
    quantity.value = value;
    update();
  }
}
