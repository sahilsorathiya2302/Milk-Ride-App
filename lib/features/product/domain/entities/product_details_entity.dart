import 'filtered_packages.dart';

class ProductDetailsEntity {
  List<FilteredPackages>? filteredPackages;
  List<String>? extraImages;
  String? morningCutoff;
  String? eveningCutoff;
  bool? morningCutoffFlag;
  bool? eveningCutoffFlag;

  ProductDetailsEntity({
    this.filteredPackages,
    this.extraImages,
    this.morningCutoff,
    this.eveningCutoff,
    this.morningCutoffFlag,
    this.eveningCutoffFlag,
  });

  ProductDetailsEntity.fromJson(Map<String, dynamic> json) {
    if (json['filteredPackages'] != null && json['filteredPackages'] is List) {
      filteredPackages = (json['filteredPackages'] as List)
          .where((e) => e != null && e is Map<String, dynamic>)
          .map((e) => FilteredPackages.fromJson(e))
          .toList();
    }

    if (json['extraImages'] != null && json['extraImages'] is List) {
      extraImages = json['extraImages'].whereType<String>().toList();
    }

    morningCutoff = json['morning_cutoff'];
    eveningCutoff = json['evening_cutoff'];
    morningCutoffFlag = json['morning_cutoff_flag'];
    eveningCutoffFlag = json['evening_cutoff_flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (filteredPackages != null) {
      data['filteredPackages'] =
          filteredPackages!.map((v) => v.toJson()).toList();
    }

    data['extraImages'] = extraImages;
    data['morning_cutoff'] = morningCutoff;
    data['evening_cutoff'] = eveningCutoff;
    data['morning_cutoff_flag'] = morningCutoffFlag;
    data['evening_cutoff_flag'] = eveningCutoffFlag;

    return data;
  }
}
