import 'package:front_end/core/usecase/base_usecase.dart';
import 'package:front_end/core/utils/typedef.dart';
import 'package:front_end/features/auth/domain/entities/user.dart';
import 'package:front_end/features/auth/domain/repository/base_auth_repository.dart';

class GetUserUseCase extends BaseUseCase<User, NoParameters> {
  GetUserUseCase(this.authRepository);

  final BaseAuthRepository authRepository;

  @override
  ResultFuture<User> call(NoParameters parameters) async {
    return await authRepository.getUser();
  }
  
}
