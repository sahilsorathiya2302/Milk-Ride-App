class Regions {
  final int? _id;
  final String? _name;

  Regions({int? id, String? name})
      : _id = id,
        _name = name;

  factory Regions.fromJson(Map<String, dynamic> json) => Regions(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': _id,
        'name': _name,
      };
}
