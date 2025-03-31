import 'package:milk_ride_live_wc/features/home/domain/entities/home_data.dart';
import 'package:milk_ride_live_wc/features/home/domain/entities/home_response.dart';

class HomeModel extends HomeResponse {
  HomeModel({super.status, super.statusCode, super.message, super.data});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
        status: json['status'],
        statusCode: json['statusCode'],
        message: json['message'],
        data: json['data'] != null ? HomeData.fromJson(json['data']) : null);
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
