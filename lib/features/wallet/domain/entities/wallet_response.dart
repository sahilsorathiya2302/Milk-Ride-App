import 'package:milk_ride_live_wc/features/wallet/domain/entities/wallet_data.dart';

class WalletResponse {
  final String? status;
  final int? statusCode;
  final String? message;
  final WalletData? data;

  WalletResponse(
      {required this.status,
      required this.statusCode,
      required this.message,
      required this.data});
}
