import 'package:milk_ride_live_wc/features/wallet/domain/entities/pay_online_data.dart';

class PayOnlineResponse {
  final String? status;
  final int? statusCode;
  final String? message;
  final PayOnlineData? data;

  PayOnlineResponse(
      {required this.status,
      required this.statusCode,
      required this.message,
      required this.data});
}
