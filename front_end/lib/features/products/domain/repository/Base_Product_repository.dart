
import 'package:front_end/core/utils/typedef.dart';

import 'package:front_end/features/products/domain/entities/product.dart';


abstract class BaseProductRepository {

      
  ResultFuture< List<Product>> getProducts();
}
