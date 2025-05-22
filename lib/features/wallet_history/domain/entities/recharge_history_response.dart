import 'package:milk_ride_live_wc/features/wallet_history/domain/entities/recharge_history_data.dart';

class RechargeHistoryResponse {
  final String? status;
  final int? statusCode;
  final String? message;
  final List<RechargeHistoryData>? data;

  RechargeHistoryResponse(
      {required this.status,
      required this.statusCode,
      required this.message,
      required this.data});
}
