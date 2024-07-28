import 'package:front_end/core/usecase/base_usecase.dart';
import 'package:front_end/core/utils/typedef.dart';
import 'package:front_end/features/products/domain/entities/product.dart';
import 'package:front_end/features/products/domain/repository/Base_Product_repository.dart';

class GetProductsUseCase extends BaseUseCase<List<Product>, NoParameters> {
   GetProductsUseCase(this.ProductRepository);

  final BaseProductRepository ProductRepository;

  @override
  ResultFuture<List<Product>> call(NoParameters parameters) async {
    return await ProductRepository.getProducts();
  }
  
}
