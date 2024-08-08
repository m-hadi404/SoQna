part of 'product_bloc.dart';

class ProductState extends Equatable {
  final List<Product> getProducts;
  final RequestState getproductsState;
  final String getProductsMessage;
  final Product? getProduct;
  final RequestState getproductState;
  final String getProductMessage;
  final List<Product> searchResults; // نتائج البحث
  final RequestState searchState; // حالة البحث
  final String searchMessage; // رسالة البحث

  const ProductState({
    this.getProducts = const [],
    this.getproductsState = RequestState.loading,
    this.getProductsMessage = '',
    this.getProduct,
    this.getproductState = RequestState.loading,
    this.getProductMessage = '',
    this.searchResults = const [],
    this.searchState = RequestState.loading,
    this.searchMessage = '',
  });

  ProductState copyWith({
    RequestState? getproductsState,
    List<Product>? getProducts,
    String? getProductsMessage,
    RequestState? getproductState,
    Product? getProduct,
    String? getProductMessage,
    List<Product>? searchResults,
    RequestState? searchState,
    String? searchMessage,
  }) {
    return ProductState(
      getproductsState: getproductsState ?? this.getproductsState,
      getProducts: getProducts ?? this.getProducts,
      getProductsMessage: getProductsMessage ?? this.getProductsMessage,
      getproductState: getproductState ?? this.getproductState,
      getProduct: getProduct ?? this.getProduct,
      getProductMessage: getProductMessage ?? this.getProductMessage,
      searchResults: searchResults ?? this.searchResults,
      searchState: searchState ?? this.searchState,
      searchMessage: searchMessage ?? this.searchMessage,
    );
  }

  @override
  List<Object?> get props => [
        getProducts,
        getproductsState,
        getProductsMessage,
        getproductState,
        getProductMessage,
        getProduct,
        searchResults,
        searchState,
        searchMessage,
      ];
}
