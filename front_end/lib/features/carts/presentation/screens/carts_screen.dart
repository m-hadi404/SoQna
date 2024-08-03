import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/core/services/services_locator.dart';
import 'package:front_end/core/utils/enums.dart';
import 'package:front_end/core/utils/user.dart';
import 'package:front_end/features/carts/domain/entities/cart.dart';
import 'package:front_end/features/carts/presentation/controller/cart_bloc.dart';
import 'package:front_end/features/carts/presentation/screens/cart_view.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_button.dart';

class CartsScreen extends StatefulWidget {
  const CartsScreen({super.key});

  @override
  State<CartsScreen> createState() => _CartsScreenState();
}

class _CartsScreenState extends State<CartsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            sl<CartBloc>()..add(const GetCartEvent(userId: userId)),
        child: Scaffold(
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
                          itemCount: state.getCarts.length,
                          itemBuilder: (context, index) {
                            return CartView(index: index, state: state);
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
                                  text: '\$${_total(state.getCarts)}',
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
                                () {},
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
            })));
  }

  String _total(List<Cart> prs) {
    var totalmap = prs.map((e) {
      return e.discountedTotal;
    });
    double total = totalmap.fold(0.0, (a,b)=>a+b);
    return total.toString();
  }
}
