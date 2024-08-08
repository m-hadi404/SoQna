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
class SearchProductEvent extends  ProductEvent {
  final String query;

  const SearchProductEvent({required this.query});

  @override
  List<Object> get props => [query];
}