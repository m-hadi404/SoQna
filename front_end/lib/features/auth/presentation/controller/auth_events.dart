import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CreateUserEvent extends AuthEvent {
  const CreateUserEvent({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.avatar,
    required this.createdAt,
  });

  final String name;
  final String email;
  final String password;
  final String phone;
  final String avatar;
  final String createdAt;

  @override
  List<Object?> get props => [name, email, password, phone, avatar, createdAt];
}

class GetUsersEvent extends AuthEvent {}
