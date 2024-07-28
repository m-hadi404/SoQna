import 'package:dartz/dartz.dart';
import 'package:front_end/core/error/exceptions.dart';
import 'package:front_end/core/error/failure.dart';
import 'package:front_end/core/utils/typedef.dart';
import 'package:front_end/features/products/data/data_source/product_remote_data_source.dart';
import 'package:front_end/features/products/domain/entities/product.dart';
import 'package:front_end/features/products/domain/repository/Base_Product_repository.dart';

class ProductRepository extends BaseProductRepository {
ProductRepository(this._baseProductRemoteDataSource);

  final BaseProductRemoteDataSource _baseProductRemoteDataSource;

  @override
  ResultFuture<List<Product>>getProducts() async {
    final result = await _baseProductRemoteDataSource.getProduct();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
          message: failure.errorMessageModel.statusMessage,
          stateCode: failure.stateCode));
    }
  }


}
