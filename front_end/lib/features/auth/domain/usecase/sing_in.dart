// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:front_end/core/usecase/base_usecase.dart';
import 'package:front_end/core/utils/typedef.dart';
import 'package:front_end/features/auth/domain/repository/base_auth_repository.dart';

import '../entities/user.dart';

class SignInUseCase extends BaseUseCase<User, SignInParameters> {
  SignInUseCase(this.authRepository);

  final BaseAuthRepository authRepository;

  @override
  ResultFuture<User> call(SignInParameters parameters) async =>
      authRepository.signIn(username: parameters.username, password: parameters.password);
}

class SignInParameters extends Equatable {
  const SignInParameters({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  @override
  List<Object?> get props => [username, password];
}
