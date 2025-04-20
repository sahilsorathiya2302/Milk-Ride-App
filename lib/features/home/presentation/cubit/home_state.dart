import 'package:equatable/equatable.dart';
import 'package:milk_ride_live_wc/features/auth/domain/entities/customer.dart';
import 'package:milk_ride_live_wc/features/home/domain/entities/banners.dart';
import 'package:milk_ride_live_wc/features/home/domain/entities/home_response.dart';
import 'package:milk_ride_live_wc/features/product/domain/entities/cetegories.dart';
import 'package:milk_ride_live_wc/features/product/domain/entities/product_data.dart';

class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final HomeResponse homeResponse;

  HomeLoaded({required this.homeResponse});

  List<ProductData>? get bestSeller => homeResponse.data?.bestSeller;
  List<Banners>? get headerBanners => homeResponse.data?.headerBanners;
  List<Banners>? get middleBanners => homeResponse.data?.middleBanners;
  List<Banners>? get footerBanners => homeResponse.data?.footerBanners;
  List<Categories>? get categories => homeResponse.data?.categories;
  List<ProductData>? get seasonal => homeResponse.data?.seasonal;
  List<ProductData>? get newArrival => homeResponse.data?.newArrival;
  Customer? get customer => homeResponse.data?.customer;
}

class HomeError extends HomeState {
  final String failure;

  HomeError({required this.failure});

  @override
  List<Object> get props => [failure];
}
