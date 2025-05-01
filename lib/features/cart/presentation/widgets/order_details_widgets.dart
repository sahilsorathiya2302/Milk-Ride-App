import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milk_ride_live_wc/core/ui_component/custom_order_details.dart';
import 'package:milk_ride_live_wc/features/cart/presentation/cubit/cart/cart_cubit.dart';

import '../cubit/cart/cart_state.dart';

class OrderDetailsWidgets extends StatefulWidget {
  const OrderDetailsWidgets({
    super.key,
  });

  @override
  State<OrderDetailsWidgets> createState() => _OrderDetailsWidgetsState();
}

class _OrderDetailsWidgetsState extends State<OrderDetailsWidgets> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoadedState) {
          return CustomOrderDetails(
            subTotal: state.totalPrice.toString(),
            amount: state.totalPrice.toString(),
          );
        }
        return SizedBox();
      },
    );
  }
}
