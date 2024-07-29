import 'package:front_end/core/utils/typedef.dart';
import 'package:front_end/features/carts/domain/entities/addCartEntite.dart';
import 'package:front_end/features/carts/domain/entities/cart.dart';


abstract class BaseCartRepository {
  ResultFuture<List<Cart>> getCart(int id);
  ResultVoid addCart({required int userId,required List<Addcartentite> products});
  ResultVoid deleteCart(int id);
  ResultVoid updateCart(int id , List<Addcartentite> products);
}
