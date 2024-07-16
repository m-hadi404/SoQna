import 'package:dartz/dartz.dart';
import 'package:front_end/core/error/exceptions.dart';
import 'package:front_end/core/error/failure.dart';
import 'package:front_end/core/utils/typedef.dart';
import 'package:front_end/features/auth/data/data_source/user_remote_data_source.dart';
import 'package:front_end/features/auth/domain/entities/user.dart';
import 'package:front_end/features/auth/domain/repository/base_auth_repository.dart';

class AuthRepository extends BaseAuthRepository {
  AuthRepository(this._baseUserRemoteDataSource);

  final BaseUserRemoteDataSource _baseUserRemoteDataSource;

  @override
  ResultVoid createUser(
      {required String name,
      required String email,
      required String password,
      required String phone,
      required String avatar,
      required String createdAt}) async {
    try {
      await _baseUserRemoteDataSource.createUser(
          name: name,
          email: email,
          password: password,
          phone: phone,
          avatar: avatar,
          createdAt: createdAt);
      return const Right(null);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
          message: failure.errorMessageModel.statusMessage,
          stateCode: failure.stateCode));
    }
  }

  @override
  ResultFuture<List<User>> getUsers() async {
    final result = await _baseUserRemoteDataSource.getUsers();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
          message: failure.errorMessageModel.statusMessage,
          stateCode: failure.stateCode));
    }
  }
}
