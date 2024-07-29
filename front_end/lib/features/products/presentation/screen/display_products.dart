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
                 
                    child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // عدد الأعمدة
            childAspectRatio: 2 / 3, // نسبة العرض إلى الارتفاع
            crossAxisSpacing: 10, // المسافة الأفقية بين البطاقات
            mainAxisSpacing: 10, // المسافة العمودية بين البطاقات
          ),
          padding: EdgeInsets.all(10),
          itemCount: state.getProducts.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // تنفيذ حدث عند الضغط على البطاقة
             /*    print('Card ${[index].name} pressed'); */
              },
              child: Card(
                child: Column(
                  children: [
                    Image.network(
                      state.getProducts[index].images[0],
                      fit: BoxFit.cover,
                      height: 100,
                      width: double.infinity,
                    ),
                    SizedBox(height: 10),
                    Text(
                      '\$${state.getProducts[index].price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      state.getProducts[index].title,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
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
