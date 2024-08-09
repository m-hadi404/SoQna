import 'package:dartz/dartz.dart';
import 'package:front_end/core/error/exceptions.dart';
import 'package:front_end/core/error/failure.dart';
import 'package:front_end/core/utils/typedef.dart';
import 'package:front_end/features/carts/data/data_source/cart_remote_data_source.dart';
import 'package:front_end/features/carts/data/model/addCart_model.dart';
import 'package:front_end/features/carts/domain/entities/cart.dart';
import 'package:front_end/features/carts/domain/repository/base_cart_repository.dart';

class CartRepository extends BaseCartRepository {
  CartRepository(this._baseCartRemoteDataSource);

  final BaseCartRemoteDataSource _baseCartRemoteDataSource;

  @override
  ResultVoid addCart(
      {required int userId, required List<AddCartModel> products}) async {
    try {
      await _baseCartRemoteDataSource.addCart(
          userId: userId, products: products);
      return Right(null);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
          message: failure.errorMessageModel.statusMessage,
          stateCode: failure.stateCode));
    }
  }

  @override
  ResultVoid deleteCart({required int id}) async {
    try {
      await _baseCartRemoteDataSource.deleteCart(id: id);
      return Right(null);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
          message: failure.errorMessageModel.statusMessage,
          stateCode: failure.stateCode));
    }
  }

  @override
  ResultFuture<List<Cart>> getCart({required int userId}) async {
    try {
      final getdata = await _baseCartRemoteDataSource.getCart(userId: userId);
      return Right(getdata);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
          message: failure.errorMessageModel.statusMessage,
          stateCode: failure.stateCode));
    }
  }

  @override
  ResultVoid updateCart(
      {required int id, required List<AddCartModel> products}) async {
    try {
      await _baseCartRemoteDataSource.updateCart(
          id: id, products: products);
      return Right(null);
      
    } on ServerException catch (failure) {
      return Left(ServerFailure(
          message: failure.errorMessageModel.statusMessage,
          stateCode: failure.stateCode));
    }
  }
}
