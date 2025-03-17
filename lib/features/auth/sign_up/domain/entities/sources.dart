class Sources {
  final int? _id;
  final String? _name;

  Sources({int? id, String? name})
      : _id = id,
        _name = name;

  factory Sources.fromJson(Map<String, dynamic> json) => Sources(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': _id,
        'name': _name,
      };
}
