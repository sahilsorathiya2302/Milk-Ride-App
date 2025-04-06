import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milk_ride_live_wc/features/product/presentation/cubit/discount/discount_state.dart';

class DiscountCubit extends Cubit<DiscountState> {
  int selectedOfferIndex = 0;
  DiscountCubit() : super(DiscountInitial());
  void selectOffer(int index) {
    selectedOfferIndex = index;
    emit(DiscountSelectUpdate(index));
  }
}
