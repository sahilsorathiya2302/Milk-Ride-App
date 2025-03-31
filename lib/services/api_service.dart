import "package:dio/dio.dart";
import 'package:milk_ride_live_wc/core/common_model/api_response_model.dart';
import 'package:milk_ride_live_wc/core/secret/end_points.dart';
import 'package:milk_ride_live_wc/core/secret/server_config.dart';
import 'package:milk_ride_live_wc/core/storage/storage_manager.dart';
import 'package:milk_ride_live_wc/features/auth/data/models/get_area_model.dart';
import 'package:milk_ride_live_wc/features/auth/data/models/otp_model.dart';
import 'package:milk_ride_live_wc/features/auth/data/models/regions_source_model.dart';
import 'package:milk_ride_live_wc/features/auth/data/models/register_model.dart';
import 'package:milk_ride_live_wc/features/home/data/models/home_model.dart';
import 'package:milk_ride_live_wc/services/interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

import '../features/auth/data/models/sign_in_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ServerConfig.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio) {
    final String? token = StorageManager.readData("token");
    print("Retrieved Token: $token");

    dio.options = BaseOptions(
      baseUrl: ServerConfig.baseUrl,
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
      headers: {
        if (token != null) "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );

    final interceptor = DefaultInterceptor();
    dio.interceptors.add(interceptor);

    dio.interceptors.add(
      PrettyDioLogger(
        responseHeader: true,
        responseBody: true,
        requestHeader: true,
        requestBody: true,
      ),
    );

    print("Headers Before Request: \${dio.options.headers}");

    return _ApiService(dio);
  }

  @POST(ServerConfig.milkRideVersion + EndPoints.signInPath)
  Future<SignInModel> postSignInData({
    @Field("mobile_number") required String mobileNumber,
    @Field("user_id") required String userId,
  });

  @POST(ServerConfig.milkRideVersion + EndPoints.otp)
  Future<OtpVerifyModel> checkOtp({
    @Field("mobile_number") required String mobileNumber,
    @Field("user_id") required int userId,
    @Field("otp") required String otp,
  });

  @POST(ServerConfig.milkRideVersion + EndPoints.resendOtp)
  Future<ApiResponseModel> resendOtp({
    @Field("mobile_number") required String mobileNumber,
    @Field("user_id") required int userId,
  });

  @POST(ServerConfig.milkRideVersion + EndPoints.register)
  Future<RegisterModel> register({
    @Field("name") required String name,
    @Field("email") required String? email,
    @Field("source_id") required String sourceId,
    @Field("address[area_id]") required String areaId,
    @Field("address[house_no]") required String houseNo,
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
    @Field("mobile_number") required String mobileNumber,
  });

  @POST(ServerConfig.milkRideVersion + EndPoints.signUp)
  Future<RegionsSourceModel> fetchRegionsSourceData({
    @Field("mobile_number") required String mobileNumber,
    @Field("user_id") required int userId,
  });

  @GET(ServerConfig.customerVersion + EndPoints.getAreas)
  Future<List<GetAreaModel>> getAreas({@Path("id") required int id});

  @POST(ServerConfig.milkRideVersion + EndPoints.home)
  Future<HomeModel> getHomeData({
    @Field("mobile_number") required String mobileNumber,
    @Field("user_id") required int userId,
    @Field("type") required String type,
    @Field("device_type") required String deviceType,
    @Field("device_model") required String devicesModel,
    @Field("version") required String version,
    @Field("device_id") required String devicesId,
  });
}
