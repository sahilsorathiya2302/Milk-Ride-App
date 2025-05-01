import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milk_ride_live_wc/features/create_subscription/presentation/cubit/create_subscription_cubit.dart';

import '../cubit/create_subscription_state.dart';

class SubscriptionQuantitySector extends StatefulWidget {
  final int minQuantity;
  final int instantlyQuantity;
  final int maxQuantity;

  const SubscriptionQuantitySector({
    super.key,
    required this.minQuantity,
    required this.instantlyQuantity,
    required this.maxQuantity,
  });

  @override
  State<SubscriptionQuantitySector> createState() =>
      _SubscriptionQuantitySectorState();
}

class _SubscriptionQuantitySectorState
    extends State<SubscriptionQuantitySector> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Get.context
          ?.read<CreateSubscriptionCubit>()
          .setQuantity(widget.instantlyQuantity);
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateSubscriptionCubit>();

    return BlocBuilder<CreateSubscriptionCubit, CreateSubscriptionState>(
      builder: (context, state) {
        return Container(
          height: 30.h,
          width: 100.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildIconButton(
                icon: Icons.remove,
                onPressed: () => cubit.decrementQuantity(),
              ),
              Text(
                state.quantity.toString(),
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              _buildIconButton(
                icon: Icons.add,
                onPressed: () => cubit.incrementQuantity(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildIconButton({required IconData icon, VoidCallback? onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 40.w,
        height: 40.h,
        alignment: Alignment.center,
        child:
            Icon(icon, color: onPressed == null ? Colors.grey : Colors.black),
      ),
    );
  }
}
