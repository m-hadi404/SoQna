// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:front_end/core/usecase/base_usecase.dart';
import 'package:front_end/core/utils/typedef.dart';
import 'package:front_end/features/auth/domain/repository/base_auth_repository.dart';

import '../entities/user.dart';

class UpdateUserUseCase extends BaseUseCase<User, UpdateUserParameters> {
  UpdateUserUseCase(this.authRepository);

  final BaseAuthRepository authRepository;

  @override
  ResultFuture<User> call(UpdateUserParameters parameters) async =>
      authRepository.updateUser(
          id: parameters.id,
          username: parameters.username,
          password: parameters.password,
          email: parameters.email,
          firstName: parameters.firstName,
          lastName: parameters.lastName);
}

class UpdateUserParameters extends Equatable {
 
  final int id;
  final String password;
  final String? username;
  final String? email;
  final String? firstName;
  final String? lastName;

  const UpdateUserParameters({
    required this.id,
    required this.password,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
  });

  

  @override
  List<Object> get props {
    return [id,password];
  }
}
