import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:front_end/core/usecase/base_usecase.dart';
import 'package:front_end/core/utils/enums.dart';
import 'package:front_end/features/products/domain/entities/product.dart';
import 'package:front_end/features/products/domain/usecase/get_products.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
 final GetProductsUseCase getProductsUseCase;
  ProductBloc(this.getProductsUseCase) 
  : super(const ProductState()) {
    on< GetProductsEvent>(_getProductsHandler);
  }
   FutureOr<void> _getProductsHandler(
   GetProductsEvent event, Emitter< ProductState> emit) async {
    final result = await getProductsUseCase(const NoParameters());
    // print(result);
    // emit(const AuthState(getUsersState: RequestState.loaded));
    result.fold(
        (l) => emit(state.copyWith(
            getProductsMessage: l.message, getproductsState: RequestState.error)),
        (r) => emit(
            state.copyWith(getProducts: r, getproductsState: RequestState.loaded)));
  }
}
