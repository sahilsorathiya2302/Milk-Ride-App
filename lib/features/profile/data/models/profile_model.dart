import 'package:milk_ride_live_wc/features/profile/domain/entities/profile_data.dart';
import 'package:milk_ride_live_wc/features/profile/domain/entities/profile_response.dart';

class ProfileModel extends ProfileResponse {
  ProfileModel({super.status, super.statusCode, super.message, super.data});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
        status: json['status'],
        statusCode: json['statusCode'],
        message: json['message'],
        data: json['data'] != null ? ProfileData.fromJson(json['data']) : null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
