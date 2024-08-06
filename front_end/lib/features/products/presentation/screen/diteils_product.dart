import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:front_end/core/utils/enums.dart';
import 'package:front_end/features/products/presentation/component/custem_text.dart';
import 'package:front_end/features/products/presentation/component/custm_buttn.dart';
import 'package:front_end/features/products/presentation/controller/product_bloc.dart';

class ProductDetailView extends StatelessWidget {
 
  ProductDetailView();

  @override
  Widget build(BuildContext context) {
    // Dispatch the event only once when the widget is built for the first time

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: BlocConsumer<ProductBloc, ProductState>(
        buildWhen: (previous, current) =>
            previous.getproductState != current.getproductState,
        listener: (BuildContext context, ProductState state) {
          if (state.getproductState == RequestState.error) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${state.getProductMessage}')),
              );
            });
          }
        },
        builder: (BuildContext context, ProductState state) {
          if (state.getproductState == RequestState.loading) {
         
            print(state.getProduct);
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.getproductState == RequestState.loaded) {
            return SingleChildScrollView(
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
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RoundedShapeInfo(
                              title: 'Price',
                              content: CustomText(
                                text: state.getProduct!.price.toString(),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                alignment: Alignment.center,
                              ),
                            ),
                            RoundedShapeInfo(
                              title: 'Brand',
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
                          Container(
                      width: 146.w,
                      child: CustomButton('ADD', () {
                   
                      }),
                    ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Text('Something went wrong!'),
            );
          }
        },
      ),
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
