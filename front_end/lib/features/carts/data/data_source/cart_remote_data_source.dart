import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:front_end/core/error/exceptions.dart';
import 'package:front_end/core/network/api_constances.dart';
import 'package:front_end/core/network/error_message.dart';
import 'package:front_end/core/utils/typedef.dart';
import 'package:front_end/features/carts/data/model/addCart_model.dart';
import 'package:front_end/features/carts/data/model/cart_item_model.dart';

abstract class BaseCartRemoteDataSource {
  Future<CartModel> getCart({required int userId});
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
    final response = await Dio().post(ApiConstances.addCartsPath,
        data: const JsonEncoder().convert({
          "userId": userId,
          "products": [products[0].toJson()],
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
  Future<CartModel> getCart({required int userId}) async {
    final response = await Dio().get(ApiConstances.cartsUserPath(userId));
    if (response.statusCode == 200) {
      if (response.data != null) {
        final CartModel getCarts = CartModel.from(
            (response.data['carts'][0]['products'] as List)
                .map((e) => CartItemModel.fromJson(e)));
        return getCarts;
      } else {
        print("no product");
        return [
          const CartItemModel(
              discountedTotal: 0,
              id: 0,
              title: '0',
              totalQuantity: 0,
              image: '0')
        ];
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
    final data = {
      "products": products.map((e) => e.toJson()).first,
    };
    //print(data);
    final response = await Dio().put(ApiConstances.deleteUpdateCartPath(id),
        data: const JsonEncoder().convert(data));

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
          stateCode: response.statusCode ?? 666);
    }
  }
}
