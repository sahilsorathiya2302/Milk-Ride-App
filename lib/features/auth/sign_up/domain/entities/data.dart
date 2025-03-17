import 'package:milk_ride_live_wc/features/auth/sign_up/domain/entities/regions.dart';
import 'package:milk_ride_live_wc/features/auth/sign_up/domain/entities/sources.dart';
import 'package:milk_ride_live_wc/features/auth/sign_up/domain/entities/user.dart';

class Data {
  final String? _customerMobileNumber;
  final User? _user;
  final List<Sources>? _sources;
  final List<Regions>? _regions;

  Data({
    String? customerMobileNumber,
    User? user,
    List<Sources>? sources,
    List<Regions>? regions,
  })  : _customerMobileNumber = customerMobileNumber,
        _user = user,
        _sources = sources,
        _regions = regions;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    customerMobileNumber: json['customer_mobile_number'],
    user: json['user'] != null ? User.fromJson(json['user']) : null,
    sources: json['sources'] != null
        ? List<Sources>.from(json['sources'].map((v) => Sources.fromJson(v)))
        : null,
    regions: json['regions'] != null
        ? List<Regions>.from(json['regions'].map((v) => Regions.fromJson(v)))
        : null,
  );

  Map<String, dynamic> toJson() => {
    'customer_mobile_number': _customerMobileNumber,
    'user': _user?.toJson(),
    'sources': _sources?.map((v) => v.toJson()).toList(),
    'regions': _regions?.map((v) => v.toJson()).toList(),
  };
}