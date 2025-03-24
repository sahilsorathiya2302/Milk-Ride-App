import "package:dio/dio.dart";
import 'package:milk_ride_live_wc/core/secret/end_points.dart';
import 'package:milk_ride_live_wc/core/secret/server_config.dart';
import 'package:milk_ride_live_wc/features/auth/data/models/sign_in_model.dart';
import 'package:milk_ride_live_wc/features/auth/otp/data/models/otp_model.dart';
import 'package:milk_ride_live_wc/features/auth/otp/data/models/resend_otp_model.dart';
import 'package:milk_ride_live_wc/features/auth/register/data/models/register_model.dart';
import 'package:milk_ride_live_wc/features/auth/sign_up/data/models/sign_up_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ServerConfig.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String? token}) {
    dio.options = BaseOptions(
      baseUrl: ServerConfig.baseUrl,
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
    );

    dio.interceptors.add(
      PrettyDioLogger(
        responseHeader: true,
        responseBody: true,
        requestHeader: true,
        requestBody: true,
      ),
    );

    return _ApiService(dio);
  }

  @POST(EndPoints.signInPath)
  Future<SignInModel> postSignInData(
    @Field("mobile_number") String mobileNumber,
    @Field("user_id") String userId,
  );

  @POST(EndPoints.otp)
  Future<OtpModel> checkOtp(
    @Field("mobile_number") String mobileNumber,
    @Field("user_id") int userId,
    @Field("otp") String otp,
  );

  @POST(EndPoints.resendOtp)
  Future<ResendOtpModel> resendOtp(
    @Field("mobile_number") String mobileNumber,
    @Field("user_id") int userId,
  );
  @POST(EndPoints.register)
  Future<RegisterModel> register(
    @Field("name") String name,
    @Field("email") String? email,
    @Field("source_id") String sourceId,
    @Field("address[area_id]") String areaId,
    @Field("address[house_no]") String houseNo,
    @Field("address[floor]") String? floor,
    @Field("address[society]") String? society,
    @Field("address[landmark]") String? landMark,
    @Field("address[latitude]") String? city,
    @Field("address[longitude]") String? area,
    @Field("address[pincode]") String? pinCode,
    @Field("region_id") String? regionId,
    @Field("user_id") String? userId,
    @Field("customer_referrer_code") String? referrerCode,
    @Field("agent_code") String? agentCode,
    @Field("delivery_type") String? deliveryType,
    @Field("gender") String? gender,
    @Field("mobile_number") String mobileNumber,
  );

  @GET(EndPoints.getRegion)
  @POST(EndPoints.signUpPath)
  Future<SignUpModel> postSignUpData(
    @Field('mobile_number') String mobileNumber,
    @Field('user_id') int userId,
  );
}
