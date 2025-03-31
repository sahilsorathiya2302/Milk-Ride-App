import 'package:milk_ride_live_wc/features/auth/domain/entities/data.dart';

class RegionsSourcesResponse {
  final String status;
  final int statusCode;
  final String message;
  final UserData data;

  RegionsSourcesResponse(
    this.status,
    this.statusCode,
    this.message,
    this.data,
  );
}
