import 'package:flutter/material.dart';
import 'package:front_end/core/services/services_locator.dart';
import 'package:front_end/features/auth/presentation/screens/main_screen.dart';
import 'package:front_end/features/products/presentation/screen/display_products.dart';
import 'package:front_end/features/products/presentation/screen/produs.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      home:  displayproducts()
    /*   displayproducts() *//* const MainScreen() */
    );
  }
}



