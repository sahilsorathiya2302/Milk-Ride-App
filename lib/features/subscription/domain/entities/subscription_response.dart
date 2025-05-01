import 'package:milk_ride_live_wc/features/subscription/domain/entities/subscription_data.dart';

class SubscriptionResponse {
  final String? status;
  final int? statusCode;
  final String? message;
  final List<SubscriptionData>? data;

  SubscriptionResponse(
      {required this.status,
      required this.statusCode,
      required this.message,
      required this.data});
}
