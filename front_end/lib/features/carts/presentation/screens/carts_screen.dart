import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/core/utils/enums.dart';
import 'package:front_end/core/utils/typedef.dart';
import 'package:front_end/features/carts/presentation/controller/cart_bloc.dart';
import 'package:front_end/features/carts/presentation/screens/cart_view.dart';
import '../controller/cubit/orders_cubit.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_button.dart';

class CartsScreen extends StatefulWidget {
  const CartsScreen({super.key, required this.userId});
  final int userId;
  @override
  State<CartsScreen> createState() => _CartsScreenState();
}

class _CartsScreenState extends State<CartsScreen> {
  @override
  Widget build(BuildContext context) {
    context.read<CartBloc>().add(GetCartEvent(userId: widget.userId));
    return Scaffold(
        appBar: AppBar(
          title: const Text('Carts'),
        ),
        body: BlocBuilder<CartBloc, CartState>(buildWhen: (s, e) {
          return e.getCartsState != s.getCartsState;
        }, builder: (context, state) {
          if (state.getCartsState == RequestState.loaded) {
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, right: 16.0, left: 16.0),
                    child: ListView.builder(
                      itemCount: state.getCart.length,
                      itemBuilder: (context, index) {
                        return CartView(
                            index: index, state: state, userId: widget.userId);
                      },
                    ),
                  ),
                ),
                Material(
                  elevation: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 17.0),
                    height: 100.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'TOTAL',
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                            CustomText(
                              text: '\$${_total(state.getCart)}',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50.0,
                          width: 146.0,
                          child: CustomButton(
                            'CHECKOUT',
                            () {
                              try {
                              context.read<OrdersCubit>().addOrder(state.getCart);
                                 
                              } catch (e) {
                                print(e); 
                              }
                              
                              // print(context.read<OrderCubit>().state.orders);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (state.getCartsState == RequestState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Text(state.getCartsMessage);
          }
        }));
  }

  String _total(Cart prs) {
    var totalmap = prs.map((e) {
      return e.discountedTotal;
    });
    double total = totalmap.fold(0.0, (a, b) => a + b);
    return total.toString();
  }
}
