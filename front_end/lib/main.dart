import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:front_end/core/services/services_locator.dart';
import 'package:front_end/features/auth/presentation/controller/auth_bloc.dart';
import 'package:front_end/home_screan.dart';
import 'features/auth/presentation/screens/signin_view.dart';
import 'features/auth/presentation/screens/signup_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AuthBloc>()..add(IsAuthorizedEvent()),
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
            initialRoute: '/signIn',
            routes: {
              '/signIn': (context) => SignInView(),
              '/signUp': (context) => SignUpView(),
              '/': (context) =>  HomeScrean(),
            },
          ),
        ),
      ),
    );
  }
}
