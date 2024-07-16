import 'package:front_end/core/utils/typedef.dart';
import 'package:front_end/features/auth/domain/entities/user.dart';


abstract class BaseAuthRepository {
  ResultVoid createUser(
      {required String name,
      required String email,
      required String password,
      required String phone,
      required String avatar,
      required String createdAt});
  ResultFuture< List<User>> getUsers();
}
