import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:front_end/core/utils/enums.dart';
import 'package:front_end/features/products/presentation/component/custem_text.dart';
import 'package:front_end/features/products/presentation/controller/product_bloc.dart';
import 'package:front_end/features/products/presentation/screen/diteils_product.dart';
import 'package:front_end/core/utils/colors.dart';

import '../../../auth/presentation/controller/auth_bloc.dart';

class CategoryProductsView extends StatefulWidget {
  @override
  _CategoryProductsViewState createState() => _CategoryProductsViewState();
}

class _CategoryProductsViewState extends State<CategoryProductsView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      context
          .read<ProductBloc>()
          .add(SearchProductEvent(query: _searchController.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    context.read<ProductBloc>().add(GetProductsEvent());
    return Scaffold(
      appBar: AppBar(
        title: Text('SoQna Store'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              icon: Image.asset(
                'assets/images/icons/account.png',
                height: 30.h,
                width: 30.w,
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Drawer Header',
                style: TextStyle(color: Colors.black87, fontSize: 24),
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                context.read<AuthBloc>().add(LogoutEvent());
                Navigator.popAndPushNamed(context, '/signIn');
              },
            ),
          ],
        ),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        buildWhen: (previous, current) =>
            previous.getproductsState != current.getproductsState ||
            previous.getproductState != current.getproductState ||
            previous.searchResults != current.searchResults,
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
              final productsToDisplay = _searchController.text.isEmpty
                  ? state.getProducts
                  : state.searchResults;
              return Container(
                padding: EdgeInsets.only(
                    top: 15.h, bottom: 14.h, right: 16.w, left: 16.w),
                child: Column(
                  children: [
                    Container(
                      height: 49.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(45.r),
                      ),
                      child: TextFormField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          hintText: 'Search...',
                        ),
                      ),
                    ),
                    SizedBox(height: 44.h),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: 16.w, left: 16.w, bottom: 24.h),
                        child: GridView.builder(
                          padding: const EdgeInsets.all(1),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 15,
                            mainAxisExtent: 320,
                          ),
                          itemCount: productsToDisplay
                              .length, // تحديث عدد العناصر المعروضة
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                context.read<ProductBloc>().add(GetProductEvent(
                                    id: productsToDisplay[index].id));
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailView(),
                                  ),
                                );
                              },
                              child: Container(
                                width: 164.w,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                            productsToDisplay[index].images[0],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        CustomText(
                                          text: productsToDisplay[index].title,
                                          fontSize: 14,
                                        ),
                                        CustomText(
                                          text:
                                              '\$${productsToDisplay[index].price.toString()}',
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
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
                SnackBar(content: Text(state.getProductsMessage)),
              );
              return Container(
                child: Text("Error"),
              );
          }
        },
      ),
    );
  }
}
