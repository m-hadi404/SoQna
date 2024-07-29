import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/core/utils/enums.dart';
import 'package:front_end/features/carts/domain/entities/addCartEntite.dart';
import 'package:front_end/features/carts/domain/usecase/add_cart.dart';
import 'package:front_end/features/carts/domain/usecase/delete_cart.dart';
import 'package:front_end/features/carts/domain/usecase/get_carts.dart';
import 'package:front_end/features/carts/domain/usecase/update_cart.dart';
import '../../domain/entities/cart.dart';

part 'cart_events.dart';
part 'cart_states.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartsUseCase getCartsUseCase;
  final DeleteCartsUseCase deleteCartsUseCase;
  final AddCartsUseCase addCartsUseCase;
  final UpdateCartsUseCase updateCartsUseCase;

  CartBloc(this.getCartsUseCase, this.deleteCartsUseCase, this.addCartsUseCase,
      this.updateCartsUseCase)
      : super(const CartState()) {
    on<GetCartEvent>(_getCartsHanler);
    on<AddCartEvent>(_addCartsHanler);
    on<deleteCartEvent>(_deleteCartsHanler);
    on<UpdateCartEvent>(_updateCartsHanler);
  }
  Future<void> _getCartsHanler(event, emit) async {
    final result = await getCartsUseCase(GetCartParameters(id: event.userId));
    emit(const CartState(getCartsState: RequestState.loaded));
    result.fold(
        (l) => emit(state.copyWith(
            createCartMessage: l.message, createCartState: RequestState.error)),
        (_) => emit(state.copyWith(createCartState: RequestState.loaded)));
  }

  Future<void> _addCartsHanler(event, emit) async {
    final result = await addCartsUseCase(
        AddCartParameters(userId: event.userId, products: event.products));
    result.fold(
        (l) => emit(state.copyWith(
            createCartMessage: l.message, createCartState: RequestState.error)),
        (_) => emit(state.copyWith(createCartState: RequestState.loaded)));
  }

  Future<void> _deleteCartsHanler(event, emit) async {
    final result =
        await deleteCartsUseCase(DeleteCartParameters(id: event.userId));
    result.fold(
        (l) => emit(state.copyWith(
            createCartMessage: l.message, createCartState: RequestState.error)),
        (_) => emit(state.copyWith(createCartState: RequestState.loaded)));
  }

  Future<void> _updateCartsHanler(event, emit) async {
    final result = await updateCartsUseCase(
        UpdateCartParameters(id: event.userId, products: event.products));
    result.fold(
        (l) => emit(state.copyWith(
            createCartMessage: l.message, createCartState: RequestState.error)),
        (_) => emit(state.copyWith(createCartState: RequestState.loaded)));
  }
}