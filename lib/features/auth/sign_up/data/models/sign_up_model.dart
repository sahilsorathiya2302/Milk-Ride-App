import '../../domain/entities/regions.dart';
import '../../domain/entities/sign_up_response.dart';
import '../../domain/entities/sources.dart';
import '../../domain/entities/user.dart';

class SignUpModel extends SignUpResponse {
  SignUpModel({
    super.status,
    super.statusCode,
    super.message,
    super.customerMobileNumber,
    super.user,
    super.sources,
    super.regions,
  });

  SignUpModel.fromJson(Map<String, dynamic> json)
      : super(
          customerMobileNumber: json['customer_mobile_number'],
          user: json['user'] != null ? User.fromJson(json['user']) : null,
          sources: (json['sources'] as List?)
              ?.map((v) => Sources.fromJson(v))
              .toList(),
          regions: (json['regions'] as List?)
              ?.map((v) => Regions.fromJson(v))
              .toList(),
        ) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
  }
}
