import 'customer.dart';

class OtpResponse {
  String? status;
  int? statusCode;
  String? message;
  String? data;
  String? appToken;
  Customer? customer;

  OtpResponse(
    this.status,
    this.statusCode,
    this.message,
    this.data,
    this.appToken,
    this.customer,
  );
}
