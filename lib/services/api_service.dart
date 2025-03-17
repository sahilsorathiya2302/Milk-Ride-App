import "package:dio/dio.dart";
import 'package:milk_ride_live_wc/core/secret/server_config.dart';
import 'package:milk_ride_live_wc/features/auth/sign_up/data/models/sign_up_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ServerConfig.signUpBaseUrl)
abstract class SignUpApiService {
  factory SignUpApiService(Dio dio) {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: ServerConfig.signUpBaseUrl,
      receiveTimeout: Duration(seconds: 30),
      sendTimeout: Duration(seconds: 30),
      connectTimeout: Duration(seconds: 30),
      contentType: ServerConfig.contentType,
    );
    Dio dio = Dio(baseOptions);

    dio.interceptors.add(
      PrettyDioLogger(
        responseHeader: true,
        responseBody: true,
        requestHeader: true,
        requestBody: true,
      ),
    );
    return _SignUpApiService(dio);
  }

  @POST(ServerConfig.signUpPath)
  Future<SignUpModel> postSignUpData(
    @Field('mobile_number') String mobileNumber,
    @Field('user_id') String userId,
  );
}
