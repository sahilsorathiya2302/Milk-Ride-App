import 'package:milk_ride_live_wc/features/home/domain/entities/home_data.dart';

class HomeResponse {
  final String? status;
  final int? statusCode;
  final String? message;
  final HomeData? data;

  HomeResponse(
      {required this.status,
      required this.statusCode,
      required this.message,
      required this.data});
}
