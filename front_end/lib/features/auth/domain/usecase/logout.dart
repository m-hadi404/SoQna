import 'package:front_end/core/usecase/base_usecase.dart';
import 'package:front_end/core/utils/typedef.dart';

import '../repository/base_auth_repository.dart';

class LogoutUseCase extends BaseUseCase<void, NoParameters> {
  LogoutUseCase(this.authRepository);

  final BaseAuthRepository authRepository;

  @override
  ResultFuture<void> call(NoParameters parameters) async {
    return await authRepository.logout();
  }
}