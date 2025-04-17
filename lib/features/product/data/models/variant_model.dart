import 'package:milk_ride_live_wc/features/cart/domain/entities/package_data.dart';
import 'package:milk_ride_live_wc/features/product/domain/entities/variant_response.dart';

class VariantModel extends VariantResponse {
  const VariantModel({
    super.status,
    super.statusCode,
    super.message,
    super.data,
    super.morningCutoff,
    super.eveningCutoff,
  });

  factory VariantModel.fromJson(Map<String, dynamic> json) {
    return VariantModel(
      status: json['status'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: json['data'] != null
          ? List<PackageData>.from(
              json['data'].map((v) => PackageData.fromJson(v)),
            )
          : null,
      morningCutoff: json['morning_cutoff'],
      eveningCutoff: json['evening_cutoff'],
    );
  }
}
