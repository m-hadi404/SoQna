import 'package:front_end/core/usecase/base_usecase.dart';
import 'package:front_end/core/utils/typedef.dart';

import '../repository/base_auth_repository.dart';

class IsAuthorizedUseCase extends BaseUseCase<bool, NoParameters> {
  IsAuthorizedUseCase(this.authRepository);

  final BaseAuthRepository authRepository;

  @override
  ResultFuture<bool> call(NoParameters parameters) async {
    return await authRepository.isAuthorized();
  }
}
