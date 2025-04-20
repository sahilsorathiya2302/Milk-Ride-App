import 'package:milk_ride_live_wc/features/auth/domain/entities/region.dart';
import 'package:milk_ride_live_wc/features/auth/domain/entities/source.dart';
import 'package:milk_ride_live_wc/features/auth/domain/entities/user.dart';

class UserData {
  final String customerMobileNumber;
  final User user;
  final List<Source> sources;
  final List<dynamic> areas;
  final List<Region> regions;

  UserData({
    required this.customerMobileNumber,
    required this.user,
    required this.sources,
    required this.areas,
    required this.regions,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      customerMobileNumber: json['customer_mobile_number'],
      user: User.fromJson(json['user']),
      sources:
          (json['sources'] as List).map((e) => Source.fromJson(e)).toList(),
      areas: json['areas'] ?? [],
      regions:
          (json['regions'] as List).map((e) => Region.fromJson(e)).toList(),
    );
  }
}
