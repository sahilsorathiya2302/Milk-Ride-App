import 'package:milk_ride_live_wc/features/auth/domain/entities/customer.dart';

class RegisterResponse {
  final String? status;
  final int? statusCode;
  final String? message;
  final Customer? customer;
  final String? appToken;

  RegisterResponse(
    this.status,
    this.statusCode,
    this.message,
    this.customer,
    this.appToken,
  );
}
