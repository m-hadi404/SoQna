import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:front_end/core/utils/colors.dart';
import 'package:front_end/core/utils/typedef.dart';
import 'package:front_end/features/carts/presentation/controller/cubit/orders_cubit.dart';

import '../../../../core/widgets/custom_text.dart';

class OrderHistoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 80.h,
            child: Padding(
              padding: EdgeInsets.only(bottom: 24.h, left: 16.w, right: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                  CustomText(
                    text: 'Order History',
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
            child: BlocBuilder<OrdersCubit, OrdersState>(
              builder: (context, state) => ListView.separated(
                itemCount: state.orders.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(16.h),
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: "#${index + 1}",
                                    color: Colors.grey,
                                  ),
                                  CustomText(
                                    text: 'Pending',
                                    color: Colors.red.shade300,
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.grey.shade200,
                              ),
                              CustomText(
                                text: state.orders[index].fold(
                                  '',
                                  (previousValue, element) =>
                                      '$previousValue ${element.title} •',
                                ),
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.grey.shade200,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: 'Total Billed',
                                    color: primaryColor,
                                  ),
                                  CustomText(
                                    text: '\$${_total(state.orders[index])}',
                                    color: primaryColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  thickness: 1,
                  color: Colors.grey.shade200,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _total(Cart prs) {
    var totalmap = prs.map((e) {
      return e.discountedTotal;
    });
    double total = totalmap.fold(0.0, (a, b) => a + b);
    return total.toString();
  }
}
