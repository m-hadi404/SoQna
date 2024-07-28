part of 'product_bloc.dart';



/* final class ProductInitial extends ProductState {}
part of 'auth_bloc.dart'; */
class ProductState extends Equatable {
  final List<Product> getProducts;
  final RequestState getproductsState;
  final String getProductsMessage;

  const ProductState({
    this.getProducts = const [],
    this.getproductsState = RequestState.loading,
    this. getProductsMessage = '',
  });

  ProductState copyWith({
    RequestState? getproductsState,
    List<Product>? getProducts,
    String? getProductsMessage
  }) {
    return ProductState(
      getproductsState: getproductsState ?? this.getproductsState,
      getProducts: getProducts ?? this.getProducts,
      getProductsMessage: getProductsMessage ?? this.getProductsMessage,
    );
  }

  @override
  List<Object?> get props => [getProducts, getproductsState, getProductsMessage];
}
