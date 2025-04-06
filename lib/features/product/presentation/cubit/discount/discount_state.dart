import 'package:equatable/equatable.dart';

abstract class DiscountState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class DiscountInitial extends DiscountState {}

class DiscountSelectUpdate extends DiscountState {
  final int selectedIndex;

  DiscountSelectUpdate(this.selectedIndex);

  @override
  List<Object?> get props => [selectedIndex];
}
