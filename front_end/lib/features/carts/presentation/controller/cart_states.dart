part of 'cart_bloc.dart';
class CartState extends Equatable {

  final RequestState createCartState;
  final String createCartMessage;

  final List<Cart> getCarts;
  final RequestState getCartsState;
  final String getCartsMessage;

  const CartState(
      {
      this.createCartState = RequestState.loading,
      this.createCartMessage = '',
      this.getCarts = const [],
      this.getCartsState = RequestState.loading,
      this.getCartsMessage = '',
      });

  CartState copyWith({
    RequestState? createCartState,
    String? createCartMessage,
    List<Cart>? getCarts,
    RequestState? getCartsState,
    String? getCartsMessage,
  }) {
    return CartState(
      createCartState: createCartState ?? this.createCartState,
      createCartMessage: createCartMessage ?? this.createCartMessage,
      getCarts: getCarts ?? this.getCarts,
      getCartsState: getCartsState ?? this.getCartsState,
      getCartsMessage: getCartsMessage ?? this.getCartsMessage,
    );
  }

  @override
  List<Object?> get props => [
        createCartState,
        createCartMessage,
        getCarts,
        getCartsState,
        getCartsMessage,
      ];
}
