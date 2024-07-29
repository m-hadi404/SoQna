import 'dart:convert';

import 'package:front_end/core/utils/typedef.dart';
import 'package:front_end/features/auth/domain/entities/user.dart';

class UserModel extends User {

  const UserModel(
      {required super.id,
      required super.username,
      required super.email,
      required super.firstName,
      required super.lastName,
      required super.age,
      required super.image});


  factory UserModel.fromJson(DataMap map) {
    return UserModel(
      id: map['id'] as int,
      username: map['username'] as String,
      email: map['email'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      age: map['age'] as int,
      image: map['image'] as String,
    );
  }



  User copyWith({
    int? id,
    String? username,
    String? email,
    String? firstName,
    String? lastName,
    int? age,
    String? image,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      age: age ?? this.age,
      image: image ?? this.image,
    );
  }
}
