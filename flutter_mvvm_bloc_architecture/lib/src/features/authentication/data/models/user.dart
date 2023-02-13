// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
      {required super.name,
      required super.email,
      required super.gender,
      required super.status});

  fromJson(String source) {
    UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'gender': gender.toJson(),
      'status': status.toJson(),
    };
  }

  @override
  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] as String,
      email: json['email'] as String,
      gender: Gender.fromJson(json['gender']),
      status: UserStatus.fromJson(json['status']),
    );
  }
}
