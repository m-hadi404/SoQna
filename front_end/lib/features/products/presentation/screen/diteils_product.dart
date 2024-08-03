import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:front_end/core/utils/enums.dart';
import 'package:front_end/features/products/data/model/product_model.dart';
import 'package:front_end/features/products/presentation/component/custem_text.dart';
import 'package:front_end/features/products/presentation/controller/product_bloc.dart';

class ProductDetailView extends StatelessWidget {
  final int id;

  ProductDetailView(this.id);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state.getproductState == RequestState.error) {
          SnackBar(
            content: Text('errore'),
          );
        }
      },
      builder: (context, state) {
        if (state.getproductState == RequestState.loading) {
          context.read<ProductBloc>().add(GetProductEvent(id: id));
          print(state.getProduct);

          print(state.getProductMessage);
          return Center(
            child: CircularProgressIndicator(),
          );
        } 
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Container(
                              height: 196.h,
                              width: double.infinity,
                              child: Image.network(
                                state.getProduct!.images[0],
                                fit: BoxFit.cover,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                //go back
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 4.h),
                          child: Column(
                            children: [
                              CustomText(
                                text: state.getProduct!.title,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RoundedShapeInfo(
                                    title: 'pirce',
                                    content: CustomText(
                                      text: state.getProduct!.price.toString(),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                  RoundedShapeInfo(
                                    title: 'brand',
                                    content: Container(
                                      child: Text(state.getProduct!.brand),
                                      height: 22.h,
                                      width: 22.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 33.h,
                              ),
                              CustomText(
                                text: 'Details',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              CustomText(
                                text: state.getProduct!.description,
                                fontSize: 14,
                                height: 2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Material(
                  elevation: 12,
                  color: Colors.white,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 17.h, horizontal: 30.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'PRICE',
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                            CustomText(
                              text: '\$${state.getProduct!.price}',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ],
                        ),
                        /*   GetBuilder<CartViewModel>(
                                    builder: (controller) => Container(
                                      width: 146.w,
                                      child: CustomButton('ADD', () {
                                        controller.addProduct(
                                          CartModel(
                                            name: _productModel.name,
                                            image: _productModel.image,
                                            price: _productModel.price,
                                            productId: _productModel.productId,
                                          ),
                                        );
                                      }),
                                    ),
                                  ), */
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
   
      },
    );
  }
}

class RoundedShapeInfo extends StatelessWidget {
  final String title;
  final Widget content;

  const RoundedShapeInfo({
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 160.w,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: title,
              fontSize: 14,
              alignment: Alignment.center,
            ),
            content,
          ],
        ),
      ),
    );
  }
}
