// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:front_end/core/usecase/base_usecase.dart';
import 'package:front_end/core/utils/typedef.dart';
import 'package:front_end/features/auth/domain/repository/base_auth_repository.dart';

import '../entities/user.dart';

class SignUpUseCase extends BaseUseCase<User, SignUpParameters> {
  SignUpUseCase(this.authRepository);

  final BaseAuthRepository authRepository;

  @override
  ResultFuture<User> call(SignUpParameters parameters) async =>
      authRepository.signUp(
          username: parameters.username,
          password: parameters.password,
          email: parameters.email,
          firstName: parameters.firstName,
          lastName: parameters.lastName,
          age: parameters.age);
}

class SignUpParameters extends Equatable {
 
  final String username;
  final String password;
  final String email;
  final String firstName;
  final String lastName;
  final int age;

  const SignUpParameters({
    required this.username,
    required this.password,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.age,
  });

  

  @override
  List<Object> get props {
    return [
      username,
      password,
      email,
      firstName,
      lastName,
      age,
    ];
  }
}
