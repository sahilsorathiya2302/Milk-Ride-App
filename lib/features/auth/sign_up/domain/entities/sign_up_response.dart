import 'package:milk_ride_live_wc/features/auth/sign_up/domain/entities/regions.dart';
import 'package:milk_ride_live_wc/features/auth/sign_up/domain/entities/sources.dart';
import 'package:milk_ride_live_wc/features/auth/sign_up/domain/entities/user.dart';

class SignUpResponse {
  final String? status;
  final int? statusCode;
  final String? message;
  final String? customerMobileNumber;
  final User? user;
  final List<Sources>? sources;
  final List<Regions>? regions;

  SignUpResponse(
      {this.status,
      this.statusCode,
      this.message,
      this.customerMobileNumber,
      this.user,
      this.sources,
      this.regions});
}
