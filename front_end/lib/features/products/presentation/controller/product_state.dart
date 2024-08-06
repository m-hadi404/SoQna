part of 'product_bloc.dart';



/* final class ProductInitial extends ProductState {}
part of 'auth_bloc.dart'; */
class ProductState extends Equatable {
  final List<Product> getProducts;
  final RequestState getproductsState;
  final String getProductsMessage;
  final Product?  getProduct;
  final RequestState getproductState;
  final String getProductMessage;
  const ProductState({
    this.getProducts = const [],
    this.getproductsState = RequestState.loading,
    this. getProductsMessage = '',
    this.getProduct,
    this.getproductState = RequestState.loading,
    this. getProductMessage = '',
  });

  ProductState copyWith({
    RequestState? getproductsState,
    List<Product>? getProducts,
    String? getProductsMessage,
       RequestState? getproductState,
     Product? getProduct,
    String? getProductMessage
  }) {
    return ProductState(
      getproductsState: getproductsState ?? this.getproductsState,
      getProducts: getProducts ?? this.getProducts,
      getProductsMessage: getProductsMessage ?? this.getProductsMessage,
      getproductState: getproductState ?? this.getproductState,
      getProduct: getProduct ?? this.getProduct,
      getProductMessage: getProductMessage ?? this.getProductMessage,
    );
  }

  @override
  List<Object?> get props =>
   [getProducts, getproductsState, getProductsMessage,
    getproductState, getProductMessage, getProduct 
   ];
}
