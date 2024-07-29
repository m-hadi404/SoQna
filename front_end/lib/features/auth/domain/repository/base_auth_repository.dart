import 'package:front_end/core/utils/typedef.dart';
import 'package:front_end/features/auth/domain/entities/user.dart';

abstract class BaseAuthRepository {
  ResultFuture<User> getUser();

  ResultFuture<User> signUp(
      {required String username,
      required String password,
      required String email,
      required String firstName,
      required String lastName,
      required int age});
  ResultFuture<User> signIn(
      {required String username, required String password});
  ResultFuture<User> updateUser(
      {required int id,
      required String password,
      String? username,
      String? email,
      String? firstName,
      String? lastName,
      int? age});
}
