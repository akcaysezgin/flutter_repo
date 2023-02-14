import 'package:equatable/equatable.dart';

abstract class UserEntity extends Equatable {
  final int? id;
  final String name;
  final String email;
  final Gender gender;
  final UserStatus status;

  const UserEntity({
    this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.status,
  });

  @override
  List<Object> get props {
    return [
      id ?? 0,
      name,
      email,
      gender,
      status,
    ];
  }
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
