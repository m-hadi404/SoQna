import 'package:dartz/dartz.dart';
import 'package:front_end/core/error/failure.dart';

import '../../features/carts/data/model/cart_item_model.dart';
import '../../features/carts/domain/entities/cart_item.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef ResultVoid = ResultFuture<void>;

typedef DataMap = Map<String, dynamic>;

typedef Cart = List<CartItem>;
typedef CartModel = List<CartItemModel>;
