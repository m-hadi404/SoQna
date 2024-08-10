import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:front_end/core/services/services_locator.dart';
import 'package:front_end/features/carts/presentation/screens/carts_screen.dart';
import 'package:front_end/features/products/presentation/controller/product_bloc.dart';
import 'package:front_end/features/products/presentation/screen/products.dart';
import 'package:front_end/features/auth/presentation/controller/auth_bloc.dart';
import 'package:front_end/profile_view.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'check_auth.dart';
import 'features/auth/presentation/screens/edit_profile_view.dart';
import 'features/auth/presentation/screens/signin_view.dart';
import 'features/auth/presentation/screens/signup_view.dart';
import 'features/carts/presentation/controller/cart_bloc.dart';
import 'features/carts/presentation/controller/cubit/orders_cubit.dart';
import 'features/carts/presentation/screens/order_history_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AuthBloc>()
            ..add(IsAuthorizedEvent())
            ..add(GetUserEvent()),
        ),
        BlocProvider(
          create: (context) => sl<ProductBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<CartBloc>(),
        ),
        BlocProvider(
          create: (context) => OrdersCubit(),
        ),
      ],
      child: OrientationBuilder(
        builder: (context, orientation) => ScreenUtilInit(
          designSize: orientation == Orientation.portrait
              ? const Size(375, 812)
              : const Size(812, 375),
          child: MaterialApp(
            theme: ThemeData(
              fontFamily: 'SourceSansPro',
            ),
            debugShowCheckedModeBanner: false,
            title: 'soQna',
            initialRoute: '/checking',
            routes: {
              '/checking': (context) => const CheckAuth(),
              '/': (context) => CategoryProductsView(),
              '/signIn': (context) => SignInView(),
              '/signUp': (context) => SignUpView(),
              '/cart': (context) => CartsScreen(),
              '/orders': (context) => OrderHistoryView(),
              '/profile': (context) => ProfileView(),
              '/editProfile': (context) => EditProfileView(),
            },
          ),
        ),
      ),
    );
  }
}
