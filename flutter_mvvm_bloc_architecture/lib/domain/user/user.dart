
import 'dart:convert';

class User {
  const User({
    this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.status,
  });

  final int? id;
  final String name;
  final String email;
  final Gender gender;
  final UserStatus status;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'gender': gender.toJson(),
      'status': status.toJson(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      email: map['email'] as String,
      gender: Gender.fromJson(map['gender']),
      status: UserStatus.fromJson(map['status']),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}

enum Gender {
  male,
  female,
  all;

  String toJson() => name;
  static Gender fromJson(String json) => values.byName(json);
}

enum UserStatus {
  inactive,
  active,
  all;

  String toJson() => name;
  static UserStatus fromJson(String json) => values.byName(json);
}
