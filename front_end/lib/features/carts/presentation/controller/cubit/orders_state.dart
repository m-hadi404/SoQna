part of 'orders_cubit.dart';


class OrdersState extends Equatable {
  final List<Cart> orders;

  const OrdersState({this.orders = const []});

  OrdersState copyWith({List<Cart>? orders}) {
    return OrdersState(
      orders: orders ?? this.orders,
    );
  }

  @override
  List<Object?> get props => [orders];
}
