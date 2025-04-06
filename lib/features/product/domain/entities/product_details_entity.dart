import 'filtered_packages.dart';

class ProductDetailsEntity {
  List<FilteredPackages>? filteredPackages;
  List<String>? extraImages;
  String? morningCutoff;
  String? eveningCutoff;
  bool? morningCutoffFlag;
  bool? eveningCutoffFlag;

  ProductDetailsEntity(
      {this.filteredPackages,
      this.extraImages,
      this.morningCutoff,
      this.eveningCutoff,
      this.morningCutoffFlag,
      this.eveningCutoffFlag});

  ProductDetailsEntity.fromJson(Map<String, dynamic> json) {
    if (json['filteredPackages'] != null) {
      filteredPackages = <FilteredPackages>[];
      json['filteredPackages'].forEach((v) {
        filteredPackages!.add(new FilteredPackages.fromJson(v));
      });
    }
    extraImages = json['extraImages'].cast<String>();
    morningCutoff = json['morning_cutoff'];
    eveningCutoff = json['evening_cutoff'];
    morningCutoffFlag = json['morning_cutoff_flag'];
    eveningCutoffFlag = json['evening_cutoff_flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.filteredPackages != null) {
      data['filteredPackages'] =
          this.filteredPackages!.map((v) => v.toJson()).toList();
    }
    data['extraImages'] = this.extraImages;
    data['morning_cutoff'] = this.morningCutoff;
    data['evening_cutoff'] = this.eveningCutoff;
    data['morning_cutoff_flag'] = this.morningCutoffFlag;
    data['evening_cutoff_flag'] = this.eveningCutoffFlag;
    return data;
  }
}
