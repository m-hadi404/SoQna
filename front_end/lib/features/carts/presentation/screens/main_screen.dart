
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/core/utils/enums.dart';
import 'package:front_end/core/services/services_locator.dart';
import 'package:front_end/features/carts/data/model/addCart_model.dart';
import 'package:front_end/features/carts/presentation/controller/cart_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CartBloc>()
        ..add(const GetCartEvent(userId:1))..add(const AddCartEvent(userId: 1, products: [AddCartModel(productId: 144, quantity: 1)])),
      child: Scaffold(
        body: BlocBuilder<CartBloc, CartState>(
            buildWhen: (previous, current) => previous.getCartsState != current.getCartsState,
            builder: (context, state) {
              switch (state.getCartsState) {
                case RequestState.loading:
                  return const SizedBox(
                    height: 250.0,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                case RequestState.loaded:
                  print(state.getCartsState);
                  return Container(
                    child: Text("loded"),
                  );
                case RequestState.error:
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.getCartsMessage)));
                  return Container(
                    child: Text("erorr"),
                  );
              }
            }),
      ),
    );
  }
}
