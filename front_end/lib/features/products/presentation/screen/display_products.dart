
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/core/utils/enums.dart';
import 'package:front_end/core/services/services_locator.dart';
import 'package:front_end/features/products/presentation/controller/product_bloc.dart';

class displayproducts extends StatelessWidget {
  const displayproducts ({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductBloc>()
        ..add(GetProductsEvent()),
        // ..add(CreateUserEvent(
        //     name: 'Mohamad',
        //     email: 'mohamad@gmail.com',
        //     password: '12345678',
        //     phone: '0987654324',
        //     avatar: ApiConstances.imageUrl("${1 + Random().nextInt(1000)}"),
        //     createdAt: DateTime.now().toString())),
      child: Scaffold(
        body: BlocBuilder<ProductBloc, ProductState>(
            buildWhen: (previous, current) =>
                previous.getproductsState != current.getproductsState,
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
                  print(state.getProducts);
                  return Container(
                    child: Text("loded"),
                  );
                case RequestState.error:
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.getProductsMessage)));
                  return Container(
                    child: Text("erorr"),
                  );
              }
            }),
      ),
    );
  }
}
