import 'dart:convert';

import 'package:front_end/core/utils/typedef.dart';
import 'package:front_end/features/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.password,
    required super.phone,
    required super.avatar,
    required super.createdAt,
  });

  

  factory UserModel.fromJson(DataMap map) {
    return UserModel(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      phone: map['phone'] as String,
      avatar: map['avatar'] as String,
      createdAt: map['createdAt'] as String,
    );
  }


  DataMap toMap() {
      return <String, dynamic>{
        'id': id,
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
        'avatar': avatar,
        'createdAt': createdAt,
      };
    }

  String toJson() => json.encode(toMap());

  
  @override
  bool get stringify => true;


  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? phone,
    String? avatar,
    String? createdAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      avatar: avatar ?? this.avatar,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  
}
