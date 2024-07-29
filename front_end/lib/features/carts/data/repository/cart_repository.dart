import 'package:dartz/dartz.dart';
import 'package:front_end/core/error/exceptions.dart';
import 'package:front_end/core/error/failure.dart';
import 'package:front_end/core/utils/typedef.dart';
import 'package:front_end/features/carts/data/data_source/cart_remote_data_source.dart';
import 'package:front_end/features/carts/data/model/addCart_model.dart';
import 'package:front_end/features/carts/domain/entities/addCartEntite.dart';
import 'package:front_end/features/carts/domain/entities/cart.dart';
import 'package:front_end/features/carts/domain/repository/base_cart_repository.dart';

class CartRepository extends BaseCartRepository {
  CartRepository(this._baseCartRemoteDataSource);

  final CartRemoteDataSource _baseCartRemoteDataSource;

  @override
  ResultVoid addCart(
      {required int userId, required List<Addcartentite> products}) async {
    try {
      await _baseCartRemoteDataSource.addCart(
          userId: userId, products: products as List<AddCartModel>);
      return Right(null);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
          message: failure.errorMessageModel.statusMessage,
          stateCode: failure.stateCode));
    }
  }

  @override
  ResultVoid deleteCart(int id) async {
    try {
      await _baseCartRemoteDataSource.deleteCart(id);
      return Right(null);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
          message: failure.errorMessageModel.statusMessage,
          stateCode: failure.stateCode));
    }
  }

  @override
  ResultFuture<List<Cart>> getCart(int id) async {
    try {
      final getdata = await _baseCartRemoteDataSource.getCart(id);
      return Right(getdata);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
          message: failure.errorMessageModel.statusMessage,
          stateCode: failure.stateCode));
    }
  }

  @override
  ResultVoid updateCart(int id, List<Addcartentite> products) async {
    try {
      await _baseCartRemoteDataSource.updateCart(
          id, products as List<AddCartModel>);
      return Right(null);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
          message: failure.errorMessageModel.statusMessage,
          stateCode: failure.stateCode));
    }
  }
}
