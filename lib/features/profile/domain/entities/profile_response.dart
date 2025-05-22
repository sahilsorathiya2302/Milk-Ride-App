import 'package:milk_ride_live_wc/features/profile/domain/entities/profile_data.dart';

class ProfileResponse {
  final String? status;
  final int? statusCode;
  final String? message;
  final ProfileData? data;

  ProfileResponse(
      {required this.status,
      required this.statusCode,
      required this.message,
      required this.data});
}
