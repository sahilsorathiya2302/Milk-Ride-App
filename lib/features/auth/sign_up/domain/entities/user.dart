class User {
  final int? _id;
  final String? _name;
  final String? _email;
  final String? _mobile;

  User({int? id, String? name, String? email, String? mobile})
      : _id = id,
        _name = name,
        _email = email,
        _mobile = mobile;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        mobile: json['mobile'],
      );

  Map<String, dynamic> toJson() => {
        'id': _id,
        'name': _name,
        'email': _email,
        'mobile': _mobile,
      };
}
