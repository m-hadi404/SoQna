import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:front_end/core/usecase/base_usecase.dart';
import 'package:front_end/core/utils/enums.dart';
import 'package:front_end/features/products/domain/entities/product.dart';
import 'package:front_end/features/products/domain/usecase/get_products.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsUseCase getProductsUseCase;

  ProductBloc(this.getProductsUseCase) : super(ProductState()) {
    on<GetProductsEvent>(_getProductsHandler);
    on<GetProductEvent>(_getProductHandler);
    on<SearchProductEvent>(_searchProductsHandler);
  }

  FutureOr<void> _getProductsHandler(
      GetProductsEvent event, Emitter<ProductState> emit) async {
    final result = await getProductsUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            getProductsMessage: l.message,
            getproductsState: RequestState.error)),
        (r) => emit(state.copyWith(
            getProducts: r, getproductsState: RequestState.loaded)));
  }

  FutureOr<void> _getProductHandler(
      GetProductEvent event, Emitter<ProductState> emit) async {
    try {
      var productList =
          state.getProducts.where((Product p) => p.id == event.id).toList();
      if (productList.isEmpty) {
        emit(state.copyWith(
          getProductMessage: "Product not found",
          getproductState: RequestState.error,
        ));
      } else {
        emit(state.copyWith(
          getProduct: productList.first,
          getproductState: RequestState.loaded,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        getProductMessage: e.toString(),
        getproductState: RequestState.error,
      ));
    }
  }

 // في ملف product_bloc.dart

  FutureOr<void> _searchProductsHandler(SearchProductEvent event, Emitter<ProductState> emit) {
    var searchResults = state.getProducts.where((product) => product.title.toLowerCase().contains(event.query.toLowerCase())).toList();
    emit(state.copyWith(searchResults: searchResults));
  }

}
