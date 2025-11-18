// lib/models/user.dart
class User {
  final String id;
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
      id: json['id'] as String,
      displayName: json['displayName'] as String,
      avatar: json['avatar'] as String,
      email: json['email'] as String,
    );
  }
}
