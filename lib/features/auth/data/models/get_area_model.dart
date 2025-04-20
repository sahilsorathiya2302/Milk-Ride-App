import '../../domain/entities/area_response.dart';

class GetAreaModel extends AreaResponse {
  GetAreaModel({super.id, super.name});

  // Factory constructor to create an instance from JSON
  factory GetAreaModel.fromJson(Map<String, dynamic> json) {
    return GetAreaModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );
  }

  // Convert an entire list from JSON
  static List<GetAreaModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => GetAreaModel.fromJson(json)).toList();
  }

  // Convert the model back to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
