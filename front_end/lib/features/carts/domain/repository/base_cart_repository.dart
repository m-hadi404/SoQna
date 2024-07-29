import 'package:front_end/core/utils/typedef.dart';
import 'package:front_end/features/carts/data/model/addCart_model.dart';
import 'package:front_end/features/carts/domain/entities/cart.dart';


abstract class BaseCartRepository {
  ResultFuture<List<Cart>> getCart({required int userId});
  ResultVoid addCart({required int userId,required List<AddCartModel> products});
  ResultVoid deleteCart({required int id});
  ResultVoid updateCart({required int id , required List<AddCartModel> products});
}
