import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:front_end/core/error/exceptions.dart';
import 'package:front_end/core/network/api_constances.dart';
import 'package:front_end/core/network/error_message.dart';
import 'package:front_end/core/utils/typedef.dart';
import 'package:front_end/features/carts/data/model/addCart_model.dart';
import 'package:front_end/features/carts/data/model/cart_model.dart';

abstract class BaseCartRemoteDataSource {
  Future<List<CartModel>> getCart({required int userId});
  Future<void> addCart(
      {required int userId, required List<AddCartModel> products});
  Future<void> deleteCart({required int id});
  Future<void> updateCart(
      {required int id, required List<AddCartModel> products});
}

class CartRemoteDataSource extends BaseCartRemoteDataSource {
  @override
  Future<void> addCart(
      {required int userId, required List<AddCartModel> products}) async {
        print({
          "userId": userId,
          "products": products.map((e) => e)as List<AddCartModel>,
        });
    final response = await Dio().post(ApiConstances.addCartsPath,
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
  Future<void> deleteCart({required int id}) async {
    final response = await Dio().delete(ApiConstances.deleteUpdateCartPath(id));
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
          stateCode: response.statusCode ?? 666);
    }
  }

  @override
  Future<List<CartModel>> getCart({required int userId}) async {
    final response = await Dio().get(ApiConstances.cartsUserPath(userId));
    //print(response.data);
    if (response.statusCode == 200) {
      if(response.data['products'] != null){
        final List<CartModel> getCarts = (response.data['products'] as List<DataMap>).map((e)=>CartModel.fromJson(e)) as List<CartModel>;
        return getCarts;
      }else{
         throw ServerException(
          errorMessageModel: const ErrorMessageModel(statusCode: 666, statusMessage: "no cart", success: "no"),
          stateCode: response.statusCode ?? 666);
      }
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
          stateCode: response.statusCode ?? 666);
    }
  }

  @override
  Future<void> updateCart(
      {required int id, required List<AddCartModel> products}) async {
    final response = await Dio().put(ApiConstances.deleteUpdateCartPath(id),
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
