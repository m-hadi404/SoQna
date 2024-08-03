import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:front_end/core/services/services_locator.dart';
import 'package:front_end/features/auth/presentation/screens/main_screen.dart';

import 'features/auth/presentation/screens/login_view.dart';
import 'features/auth/presentation/screens/register_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => ScreenUtilInit(
        designSize: orientation == Orientation.portrait
            ? Size(375, 812)
            : Size(812, 375),
        child: MaterialApp(
          theme: ThemeData(
            fontFamily: 'SourceSansPro',
          ),
          home: RegisterView(),
          debugShowCheckedModeBanner: false,
          title: 'soqna_ui',
        ),
      ),
    );
  }
}
