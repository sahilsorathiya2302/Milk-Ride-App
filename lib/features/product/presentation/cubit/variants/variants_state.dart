import 'package:equatable/equatable.dart';
import 'package:milk_ride_live_wc/features/cart/domain/entities/package_data.dart';
import 'package:milk_ride_live_wc/features/product/domain/entities/variant_response.dart';

abstract class VariantsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class VariantsInitial extends VariantsState {}

class VariantsLoading extends VariantsState {}

class VariantsLoaded extends VariantsState {
  final VariantResponse variantResponse;
  final PackageData? selectedVariant;
  final int quantity;
  final String deliveryType;
  VariantsLoaded(
      {required this.selectedVariant,
      required this.quantity,
      required this.deliveryType,
      required this.variantResponse});

  @override
  List<Object?> get props =>
      [variantResponse, selectedVariant, quantity, deliveryType];
}

class VariantsError extends VariantsState {
  final String errorMessage;

  VariantsError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
