part of 'cart_bloc.dart';


abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class AddToOrdersEvent extends CartEvent {
  final Cart cartItems;

  const AddToOrdersEvent({required this.cartItems});

  @override
  List<Object?> get props => [cartItems];
}

class GetCartEvent extends CartEvent {
  final int userId;
  const GetCartEvent({required this.userId});


  @override
  List<Object?> get props => [userId];
}

class AddCartEvent extends CartEvent {
  final int userId;
  final List<AddCartModel> products; 
  const AddCartEvent({required this.userId, required this.products});

  @override
  List<Object?> get props => [userId, products];
}

class DeleteCartEvent extends CartEvent {

  final int id;
  const DeleteCartEvent({required this.id});


  @override
  List<Object?> get props => [id];
} 

class UpdateCartEvent extends CartEvent{
   final int id;
  final List<AddCartModel> products; 
  const UpdateCartEvent({required this.id, required this.products});

  @override
  List<Object?> get props => [id, products];
}
