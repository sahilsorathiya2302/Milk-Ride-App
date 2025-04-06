import 'package:get/get.dart';

class DiscountController extends GetxController {
  var selectedIndex = (0).obs;

  void selectOffer(int index) {
    selectedIndex.value = index;
  }
}
