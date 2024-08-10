import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:front_end/core/utils/typedef.dart';

import '../../../domain/entities/cart_item.dart';

part 'orders_state.dart';

class OrdersCubit extends HydratedCubit<OrdersState> {
  OrdersCubit() : super(const OrdersState());

  void addOrder(Cart cart) {
    final updatedOrders = List<Cart>.from(state.orders)..add(cart);
    emit(state.copyWith(orders: updatedOrders));
  }

  @override
  OrdersState? fromJson(Map<String, dynamic> json) {
    if (json['orders'] == null) return null;

    final orders = (json['orders'] as List)
        .map((orderListJson) => (orderListJson as List)
            .map((cartItemJson) => CartItem.fromJson(cartItemJson))
            .toList())
        .toList();

    return OrdersState(orders: orders);
  }

  @override
  Map<String, dynamic>? toJson(OrdersState state) {
    return {
      'orders': state.orders
          .map((orderList) =>
              orderList.map((cartItem) => cartItem.toJson()).toList())
          .toList(),
    };
  }
}
