import 'package:dio/dio.dart';
import 'package:milk_ride_live_wc/core/failures/failure.dart';

class ExceptionHandler {
  ExceptionHandler._();
  static handleError({required DioException error}) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(message: "Please Check Your Network connection");
      case DioExceptionType.sendTimeout:
        return ServerFailure(message: "Plase Try again");

      case DioExceptionType.receiveTimeout:
        return ServerFailure(message: "Please try again");

      case DioExceptionType.badResponse:
        return ServerFailure(message: "Something went wrong");

      case DioExceptionType.connectionError:
        return ServerFailure(message: "Please Check Your Internet connection");

      default:
        return ServerFailure(message: "Something went wrong");
    }
  }
}
