import 'package:milk_ride_live_wc/features/cart/domain/entities/package_data.dart';

class VariantResponse {
  final String? status;
  final int? statusCode;
  final String? message;
  final List<PackageData>? data;
  final bool? morningCutoff;
  final bool? eveningCutoff;

  const VariantResponse({
    this.status,
    this.statusCode,
    this.message,
    this.data,
    this.morningCutoff,
    this.eveningCutoff,
  });
}
