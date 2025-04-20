import 'package:milk_ride_live_wc/features/auth/domain/entities/sign_up_response.dart';
import 'package:milk_ride_live_wc/features/auth/domain/entities/user_data.dart';

class RegionsSourceModel extends RegionsSourcesResponse {
  RegionsSourceModel(
    super.status,
    super.statusCode,
    super.message,
    super.data,
  );

  factory RegionsSourceModel.fromJson(Map<String, dynamic> json) {
    return RegionsSourceModel(
      json['status'],
      json['statusCode'],
      json['message'],
      UserData.fromJson(json['data']),
    );
  }
}
