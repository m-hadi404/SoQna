import 'package:dio/dio.dart';
import 'package:front_end/core/error/exceptions.dart';
import 'package:front_end/core/network/api_constances.dart';
import 'package:front_end/core/network/error_message.dart';
import 'package:front_end/features/products/data/model/product_model.dart';

abstract class BaseProductRemoteDataSource {
  Future<List<ProductModel>> getProduct();
}

class ProductRemoteDataSource extends BaseProductRemoteDataSource {
  @override
  Future<List<ProductModel>> getProduct() async {
    final response = await Dio().get(ApiConstances.productsPath);
  
    if (response.statusCode == 200) {
      //   || response.statusCode == 201
      return List<ProductModel>.from((response.data["products"] as List)
          .map((e) => ProductModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
          stateCode: response.statusCode ?? 666);
    }
  }
}
