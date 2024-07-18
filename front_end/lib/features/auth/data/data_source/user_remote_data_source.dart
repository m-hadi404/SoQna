import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:front_end/core/error/exceptions.dart';
import 'package:front_end/core/network/api_constances.dart';
import 'package:front_end/core/network/error_message.dart';
import 'package:front_end/features/auth/data/model/user_model.dart';

abstract class BaseUserRemoteDataSource {
  Future<void> createUser(
      {required String name,
      required String email,
      required String password,
      required String phone,
      required String avatar,
      required String createdAt});

  Future<List<UserModel>> getUsers();
}

class UserRemoteDataSource extends BaseUserRemoteDataSource {
  @override
  Future<List<UserModel>> getUsers() async {
    final response = await Dio().get(ApiConstances.usersPath);
    // print(response.data);
    if (response.statusCode == 200) {
      //   || response.statusCode == 201
      return List<UserModel>.from(
          (response.data as List).map((e) => UserModel.fromJson(e))
          );
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
          stateCode: response.statusCode ?? 666);
    }
  }

  @override
  Future<void> createUser(
      {required String name,
      required String email,
      required String password,
      required String phone,
      required String avatar,
      required String createdAt}) async {
    final response = await Dio().post(ApiConstances.usersPath,
        data: const JsonEncoder().convert({
          "name": name,
          "email": email,
          "password": password,
          "phone": phone,
          "avatar": avatar,
          "createdAt": createdAt
        }));
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
          stateCode: response.statusCode ?? 666);
    }
  }
}
