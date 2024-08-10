import 'package:dartz/dartz.dart';
import 'package:front_end/core/error/exceptions.dart';
import 'package:front_end/core/error/failure.dart';
import 'package:front_end/core/utils/typedef.dart';
import 'package:front_end/features/auth/data/data_source/user_local_data_source.dart';
import 'package:front_end/features/auth/data/data_source/user_remote_data_source.dart';
import 'package:front_end/features/auth/data/model/jwt_model.dart';
import 'package:front_end/features/auth/data/model/user_model.dart';
import 'package:front_end/features/auth/domain/entities/user.dart';
import 'package:front_end/features/auth/domain/repository/base_auth_repository.dart';

class AuthRepository extends BaseAuthRepository {
  AuthRepository(this._baseUserRemoteDataSource,this._baseUserLocalDataSource);

  final BaseUserRemoteDataSource _baseUserRemoteDataSource;
  final BaseUserLocalDataSource _baseUserLocalDataSource;

  @override
  ResultFuture<User> getUser() async {
    final result = await _baseUserLocalDataSource.getUser();
    try {
      return Right(result);
    } on DatabaseFailure catch (failure) {
      return Left(ServerFailure(
          message: failure.message,
          stateCode: failure.stateCode));
    }
  }

  @override
  ResultFuture<User> signIn(
      {required String username, required String password}) async {
    try {
      final result = await _baseUserRemoteDataSource.signIn(
          username: username, password: password);
      await _baseUserLocalDataSource.storeToken(jwt: JwtModel.fromJson(result));
      return Right(UserModel.fromJson(result));
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
      required String lastName}) async {
    try {
      final result = await _baseUserRemoteDataSource.signUp(
          username: username,
          password: password,
          email: email,
          firstName: firstName,
          lastName: lastName);
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
      String? lastName}) async {
    try {
      final result = await _baseUserRemoteDataSource.upateUser(
          id: id,
          username: username,
          password: password,
          email: email,
          firstName: firstName,
          lastName: lastName);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
          message: failure.errorMessageModel.statusMessage,
          stateCode: failure.stateCode));
    }
  }
  @override
  ResultFuture<bool> isAuthorized() async {
    final result = await _baseUserLocalDataSource.isAuthorized();
    try {
      return Right(result);
    } on AuthException catch (failure) {
      return Left(ServerFailure(
          message: failure.authMessage ?? '',
          stateCode: failure.statusCode ?? 404));
    }
  }

  @override
  ResultVoid logout() async {
    final result = await _baseUserLocalDataSource.logout();
    try {
      return Right(result);
    } on DatabaseFailure catch (failure) {
      return Left(ServerFailure(
          message: failure.message ,
          stateCode: failure.stateCode ));
    }
  }
}
