// lib/models/user_model.dart
class User {
  final int id;
  final String displayName;
  final String avatar;
  final String email;

  User({
    required this.id,
    required this.displayName,
    required this.avatar,
    required this.email,
  });

  // 从 JSON 对象创建 User 实例
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      displayName: json['displayName'],
      avatar: json['avatar'],
      email: json['email'],
    );
  }
}
