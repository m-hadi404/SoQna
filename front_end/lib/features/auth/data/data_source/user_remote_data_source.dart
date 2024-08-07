import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:front_end/core/error/exceptions.dart';
import 'package:front_end/core/network/api_constances.dart';
import 'package:front_end/core/network/error_message.dart';
import 'package:front_end/features/auth/data/model/user_model.dart';

import '../../../../core/utils/typedef.dart';
import '../model/jwt_model.dart';

abstract class BaseUserRemoteDataSource {
  Future<UserModel> signUp(
      {required String username,
      required String password,
      required String email,
      required String firstName,
      required String lastName});
  Future<DataMap> signIn({required String username, required String password});
  Future<UserModel> upateUser(
      {required int id,
      required String password,
      String? username,
      String? email,
      String? firstName,
      String? lastName});
  Future<JwtModel> refreshToken({required refreshToken});
}

class UserRemoteDataSource extends BaseUserRemoteDataSource {
  @override
  Future<DataMap> signIn(
      {required String username, required String password}) async {
    try {
      final response = await Dio().post(ApiConstances.signInPath,
          options: Options(headers: ApiConstances.headers("")),
          data: const JsonEncoder()
              .convert({'username': username, 'password': password}));
      return response.data as DataMap;
    } on DioException catch (e) {
      print(e.response);
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(e.response as DataMap),
          stateCode: e.response?.statusCode ?? 666);
    }
  }

  @override
  Future<UserModel> signUp(
      {required String username,
      required String password,
      required String email,
      required String firstName,
      required String lastName}) async {
    final response = await Dio().post(ApiConstances.signUpPath,
        options: Options(headers: ApiConstances.headers("")),
        data: const JsonEncoder().convert({
          'username': username,
          'email': email,
          'password': password,
          'firstName': firstName,
          'lastName': lastName,
        }));
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.data);
      return UserModel.fromJson(response.data as DataMap);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
          stateCode: response.statusCode ?? 666);
    }
  }

  @override
  Future<UserModel> upateUser(
      {required int id,
      required String password,
      String? username,
      String? email,
      String? firstName,
      String? lastName}) async {
    final response = await Dio().put(ApiConstances.updatePash(id),
        data: const JsonEncoder().convert({
          'username': username,
          'password': password,
          'email': email,
          'firstName': firstName,
          'lastName': lastName,
        }));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return UserModel.fromJson(response.data as DataMap);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
          stateCode: response.statusCode ?? 666);
    }
  }

  @override
  Future<JwtModel> refreshToken({required refreshToken}) async {
    try {
      final response = await Dio().post(ApiConstances.refershTokenPath,
          options: Options(headers: ApiConstances.headers("")),
          data: const JsonEncoder().convert({'refreshToken': refreshToken}));
      return JwtModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw AuthException(
            authMessage: e.response.toString(),
            statusCode: e.response?.statusCode);
      } else {
        throw Exception('Failed to refresh token: $e');
      }
    } catch (e) {
      print('Unexpected error: $e');
      throw Exception('Failed to login: $e');
    }
  }
}
