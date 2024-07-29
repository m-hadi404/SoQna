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
  ResultFuture<User> getUser() async {
    final result = await _baseUserRemoteDataSource.getUser();
    print(result);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
          message: failure.errorMessageModel.statusMessage,
          stateCode: failure.stateCode));
    }
  }

  @override
  ResultFuture<User> signIn(
      {required String username, required String password}) async {
    try {
      final result = await _baseUserRemoteDataSource.signIn(
          username: username, password: password);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
          message: failure.errorMessageModel.statusMessage,
          stateCode: failure.stateCode));
    }
  }

  @override
  ResultFuture<User> signUp(
      {required String username,
      required String password,
      required String email,
      required String firstName,
      required String lastName,
      required int age}) async {
    try {
      final result = await _baseUserRemoteDataSource.signUp(
          username: username,
          password: password,
          email: email,
          firstName: firstName,
          lastName: lastName,
          age: age);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
          message: failure.errorMessageModel.statusMessage,
          stateCode: failure.stateCode));
    }
  }

  @override
  ResultFuture<User> updateUser(
      {required int id,
      required String password,
      String? username,
      String? email,
      String? firstName,
      String? lastName,
      int? age}) async {
    try {
      final result = await _baseUserRemoteDataSource.upateUser(
          id: id,
          username: username,
          password: password,
          email: email,
          firstName: firstName,
          lastName: lastName,
          age: age);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
          message: failure.errorMessageModel.statusMessage,
          stateCode: failure.stateCode));
    }
  }
}
