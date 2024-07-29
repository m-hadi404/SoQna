import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/core/utils/enums.dart';
import 'package:front_end/core/services/services_locator.dart';
import 'package:front_end/features/products/presentation/controller/product_bloc.dart';

class displayproducts extends StatelessWidget {
  const displayproducts({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductBloc>()..add(GetProductsEvent()),
      child: Scaffold(
        body: BlocBuilder<ProductBloc, ProductState>(
            buildWhen: (previous, current) =>
                previous.getproductsState != current.getproductsState || previous.getproductState != current.getproductState,
            builder: (context, state) {
              switch (state.getproductsState) {
                case RequestState.loading:
                  return const SizedBox(
                    height: 250.0,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                case RequestState.loaded:

                  context.read<ProductBloc>().add(GetProductEvent(id: 0));

                  print(state.getProducts);

                  print(state.getProductMessage);      
                  return Container(
                    child: Text("loded"),
                  );
                case RequestState.error:
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.getProductMessage)));
                  return Container(
                    child: Text("erorr"),
                  );
              }
            }),
      ),
    );
  }
}
