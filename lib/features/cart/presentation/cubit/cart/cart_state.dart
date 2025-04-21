import 'package:equatable/equatable.dart';
import 'package:milk_ride_live_wc/features/cart/domain/entities/cart_response.dart';

abstract class CartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CartInitial extends CartState {}

class CartLoadingState extends CartState {}

class CartLoadedState extends CartState {
  final CartResponse cartResponse;
  final Map<int, int> productQuantities;
  final double totalPrice;

  CartLoadedState({
    required this.cartResponse,
    required this.productQuantities,
    required this.totalPrice,
  });

  @override
  List<Object?> get props => [cartResponse, productQuantities, totalPrice];
}

class CartErrorState extends CartState {
  final String errorMessage;

  CartErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
