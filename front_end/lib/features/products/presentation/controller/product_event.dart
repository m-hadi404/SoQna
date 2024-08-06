part of 'product_bloc.dart';

class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetProductsEvent extends ProductEvent {}

class GetProductEvent extends ProductEvent {
  final int? id;
 const  GetProductEvent( { required this.id});
}
