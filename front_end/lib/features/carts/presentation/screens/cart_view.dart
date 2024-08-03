import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/core/utils/user.dart';
import 'package:front_end/features/carts/data/model/addCart_model.dart';
import 'package:front_end/features/carts/presentation/controller/cart_bloc.dart';
//import 'checkout_view.dart';
import 'constants.dart';
import '../widgets/custom_text.dart';

class CartView extends StatelessWidget {
  final int index;
  final state;
  const CartView({required this.index, required this.state, super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Dismissible(
      key: Key("${state.getCarts[index].id}"),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 33.0),
        child: const Icon(
          Icons.delete_forever,
          color: Color.fromARGB(255, 247, 247, 247),
          size: 40,
        ),
      ),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          BlocProvider.of<CartBloc>(context)
            ..add(DeleteCartEvent(id: state.getCarts[index].id));
        }
      },
      child: Row(
        children: [
          Image.network(
            state.getCarts[index].image,
            height: 120.0,
            width: 120.0,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 30.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: state.getCarts[index].title,
                fontSize: 16,
              ),
              CustomText(
                text: '\$${state.getCarts[index].discountedTotal}',
                fontSize: 16,
                color: primaryColor,
              ),
              SizedBox(
                height: 16.0,
              ),
              Container(
                height: 30.0,
                width: 95.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.grey.shade300,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: const Icon(
                          Icons.add,
                          size: 20,
                        ),
                        onTap: () {
                          BlocProvider.of<CartBloc>(context)
                              .add(UpdateCartEvent(id: userId, products: [
                            AddCartModel(
                                productId: state.getCarts[index].id,
                                quantity:
                                    state.getCarts[index].totalQuantity + 1)
                          ]));
                        },
                      ),
                      CustomText(
                        text: state.getCarts[index].totalQuantity.toString(),
                        fontSize: 16,
                        alignment: Alignment.center,
                      ),
                      GestureDetector(
                        child: const Icon(
                          Icons.remove,
                          size: 20,
                        ),
                        onTap: () {
                          BlocProvider.of<CartBloc>(context)
                              .add(UpdateCartEvent(id: userId, products: [
                            AddCartModel(
                                productId: state.getCarts[index].id,
                                quantity:
                                    state.getCarts[index].totalQuantity - 1)
                          ]));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
