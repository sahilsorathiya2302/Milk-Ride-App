class ApiResponseModel {
  String? status;
  int? statusCode;
  String? message;
  String? data;

  ApiResponseModel({
    this.status,
    this.statusCode,
    this.message,
    this.data,
  });

  ApiResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['statusCode'] = statusCode;
    data['message'] = message;
    data['data'] = this.data;

    return data;
  }
}
