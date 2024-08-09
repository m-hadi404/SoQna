import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:front_end/features/products/presentation/component/custem_text.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding:
            EdgeInsets.only(top: 65.h, bottom: 14.h, right: 16.w, left: 16.w),
        child: Column(
          children: [
            Container(
              height: 49.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(45.r),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
                onFieldSubmitted: (value) {},
              ),
            ),
            SizedBox(
              height: 44.h,
            ),
            CustomText(
              text: 'Categories',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 19.h,
            ),
            ListViewCategories(),
            SizedBox(
              height: 50.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'Best Selling',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                GestureDetector(
                  onTap: () {},
                  child: CustomText(
                    text: 'See all',
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            ListViewProducts(),
          ],
        ),
      ),
    );
  }
}

class ListViewCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 90.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount:6,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
           
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Material(
                    elevation: 1,
                    borderRadius: BorderRadius.circular(50.r),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        color: Colors.white,
                      ),
                      height: 60.h,
                      width: 60.w,
                      child: Padding(
                        padding: EdgeInsets.all(14.h),
                        child: Image.network(
                          ''
                        ),
                      ),
                    ),
                  ),
                  CustomText(
                    text: 'name',
                    fontSize: 12,
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 20.w,
            );
          },
        ),
       );
  }
}

class ListViewProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              width: 164.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: Colors.white,
                    ),
                    height: 240.h,
                    width: 164.w,
                    /*  child: Image.network(
                        
                        controller.products[index].image,
                        fit: BoxFit.cover,
                      ), */
                  ),
                  CustomText(
                    text: 'name',
                    fontSize: 16,
                  ),
                  CustomText(
                    text: 'description',
                    fontSize: 12,
                    color: Colors.grey,
                    maxLines: 1,
                  ),
                  CustomText(
                    text: 'price',
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 15.w,
          );
        },
      ),
    );
  }
}
