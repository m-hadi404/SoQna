import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.avatar,
    required this.createdAt,
  });

  final String id;
  final String name;
  final String email;
  final String password;
  final String phone;
  final String avatar;
  final String createdAt;

  @override
  List<Object> get props {
    return [
      id,
      name,
      email,
      password,
      phone,
      avatar,
      createdAt,
    ];
  }
}
