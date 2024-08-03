import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:front_end/core/services/services_locator.dart';
import 'package:front_end/core/utils/enums.dart';
import 'package:front_end/features/products/presentation/component/custem_text.dart';
import 'package:front_end/features/products/presentation/controller/product_bloc.dart';

class CategoryProductsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductBloc>()..add(GetProductsEvent()),
      child: Scaffold(
        body: BlocBuilder<ProductBloc, ProductState>(
            buildWhen: (previous, current) =>
                previous.getproductsState != current.getproductsState ||
                previous.getproductState != current.getproductState,
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
                  return Container(
                    child: Column(
                      children: [
                        Container(
                          height: 130.h,
                          child: Padding(
                            padding: EdgeInsets.only(
                                bottom: 24.h, left: 16.w, right: 16.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(),
                                  onPressed: () {
                                    ;
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.black,
                                  ),
                                ),
                                CustomText(
                                  text: 'products',
                                  fontSize: 20,
                                  alignment: Alignment.bottomCenter,
                                ),
                                Container(
                                  width: 24,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                                right: 16.w, left: 16.w, bottom: 24.h),
                            child: GridView.builder(
                              padding: const EdgeInsets.all(0),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 15,
                                mainAxisExtent: 320,
                              ),
                              itemCount: state.getProducts.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                   
                             
                                  },
                                  child: Container(
                                    width: 164.w,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4.r),
                                                color: Colors.white,
                                              ),
                                              height: 240.h,
                                              width: 164.w,
                                              child: Image.network(
                                                state.getProducts[index]
                                                    .images[0],
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            CustomText(
                                              text: state
                                                  .getProducts[index].title,
                                              fontSize: 14,
                                            ),
                                            /*       CustomText(
                                text:  state.getProducts[index].description,
                                fontSize: 12,
                                color: Colors.grey,
                                maxLines: 1,
                              ), */
                                            CustomText(
                                              text:
                                                  '\$${state.getProducts[index].price.toString()}',
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 10))
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
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
