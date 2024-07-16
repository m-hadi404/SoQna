import 'package:equatable/equatable.dart';
import 'package:front_end/core/usecase/base_usecase.dart';
import 'package:front_end/core/utils/typedef.dart';
import 'package:front_end/features/auth/domain/repository/base_auth_repository.dart';

class CreateUserUseCase extends BaseUseCase<void, CreateUserParameters> {
  CreateUserUseCase(this.authRepository);

  final BaseAuthRepository authRepository;

  @override
  ResultVoid call(CreateUserParameters parameters) async =>
      authRepository.createUser(
          name: parameters.name,
          email: parameters.email,
          password: parameters.password,
          phone: parameters.phone,
          avatar: parameters.avatar,
          createdAt: parameters.createdAt);
}

class CreateUserParameters extends Equatable {
  const CreateUserParameters({
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
  List<Object?> get props =>
      [name, email, password, phone, avatar, createdAt];
}
