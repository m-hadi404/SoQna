import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:front_end/core/error/exceptions.dart';
import 'package:front_end/core/network/api_constances.dart';
import 'package:front_end/core/network/error_message.dart';
import 'package:front_end/features/carts/data/model/addCart_model.dart';
import 'package:front_end/features/carts/data/model/cart_model.dart';

abstract class BaseCartRemoteDataSource {
  Future<List<CartModel>> getCart(int id);
  Future<void> addCart(
      {required int userId, required List<AddCartModel> products});
  Future<void> deleteCart(int id);
  Future<void> updateCart(int id, List<AddCartModel> products);
}

class CartRemoteDataSource extends BaseCartRemoteDataSource {
  @override
  Future<void> addCart(
      {required int userId, required List<AddCartModel> products}) async {
    final response = await Dio().post("${ApiConstances.cartsPath}/add",
        data: const JsonEncoder().convert({
          "userId": userId,
          "products": products.map((e) => e.toJson()),
        }));
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
          stateCode: response.statusCode ?? 666);
    }
  }

  @override
  Future<void> deleteCart(int id) async {
    final response = await Dio().delete("${ApiConstances.cartsPath}/$id");
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
          stateCode: response.statusCode ?? 666);
    }
  }

  @override
  Future<List<CartModel>> getCart(int id) async {
    final response = await Dio().get("${ApiConstances.cartsPath}/$id");
    if (response.statusCode == 200) {
      //   || response.statusCode == 201
      return List<CartModel>.from(
          (response.data.products as List).map((e) => CartModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
          stateCode: response.statusCode ?? 666);
    }
  }

  @override
  Future<void> updateCart(int id, List<AddCartModel> products) async {
    final response = await Dio().put("${ApiConstances.cartsPath}/$id",
        data: const JsonEncoder().convert({
          "products": products.map((e) => e.toJson()),
        }));
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
          stateCode: response.statusCode ?? 666);
    }
  }
}