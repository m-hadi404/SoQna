part of 'cart_bloc.dart';
class CartState extends Equatable {

  final RequestState createCartState;
  final String createCartMessage;

  final Cart getCart;
  final RequestState getCartsState;
  final String getCartsMessage;

  const CartState(
      {
      this.createCartState = RequestState.loading,
      this.createCartMessage = '',
      this.getCart = const [],
      this.getCartsState = RequestState.loading,
      this.getCartsMessage = '',
      });

  CartState copyWith({
    RequestState? createCartState,
    String? createCartMessage,
    Cart? getCart,
    RequestState? getCartsState,
    String? getCartsMessage,
  }) {
    return CartState(
      createCartState: createCartState ?? this.createCartState,
      createCartMessage: createCartMessage ?? this.createCartMessage,
      getCart: getCart ?? this.getCart,
      getCartsState: getCartsState ?? this.getCartsState,
      getCartsMessage: getCartsMessage ?? this.getCartsMessage,
    );
  }

  @override
  List<Object?> get props => [
        createCartState,
        createCartMessage,
        getCart,
        getCartsState,
        getCartsMessage,
      ];
}
