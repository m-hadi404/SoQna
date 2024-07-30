import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/core/services/services_locator.dart';
import 'package:front_end/core/utils/enums.dart';
import 'package:front_end/features/carts/presentation/controller/cart_bloc.dart';
import 'package:front_end/features/carts/presentation/widgets/cart_widget.dart';

class CartsScreen extends StatelessWidget {
  const CartsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            sl<CartBloc>()..add(const GetCartEvent(userId: 6)),
        child: Scaffold(
            body: BlocBuilder<CartBloc, CartState>(
              buildWhen: (s,e){return e.getCartsState != s.getCartsState;},
              builder: (context, state) {
          if (state.getCartsState == RequestState.loaded) {
            return ListView.builder(
              itemCount: state.getCarts.length,
              itemBuilder: (context, index) {
                return const CartWidget();
              },
            );
          } else if (state.getCartsState == RequestState.loading) {
            return CircularProgressIndicator();
          } else {
            return Text(state.getCartsMessage);
          }
        })));
  }
}
