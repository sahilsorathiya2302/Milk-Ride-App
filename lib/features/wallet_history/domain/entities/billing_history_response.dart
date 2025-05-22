import 'package:milk_ride_live_wc/features/wallet_history/domain/entities/billing_history_data.dart';

class BillingHistoryResponse {
  final String? status;
  final int? statusCode;
  final String? message;
  final List<BillingHistoryData>? data;

  BillingHistoryResponse(
      {required this.status,
      required this.statusCode,
      required this.message,
      required this.data});
}
