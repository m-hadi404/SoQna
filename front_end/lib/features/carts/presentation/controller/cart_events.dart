part of 'cart_bloc.dart';


abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class GetCartEvent extends CartEvent {
  final int id;
  const GetCartEvent({required this.id});


  @override
  List<Object?> get props => [id];
}

class AddCartEvent extends CartEvent {
  final int userId;
  final List<Addcartentite> products; 
  const AddCartEvent({required this.userId, required this.products});

  @override
  List<Object?> get props => [userId, products];
}

class deleteCartEvent extends CartEvent {

  final int id;
  const deleteCartEvent({required this.id});


  @override
  List<Object?> get props => [id];
} 

class UpdateCartEvent extends CartEvent{
   final int userId;
  final List<Addcartentite> products; 
  const UpdateCartEvent({required this.userId, required this.products});

  @override
  List<Object?> get props => [userId, products];
}
