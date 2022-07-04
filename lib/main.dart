// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_demo/core/store.dart';
import 'package:flutter_demo/page/CartPage.dart';
import 'package:flutter_demo/page/GridPage.dart';
import 'package:flutter_demo/page/HomePage.dart';
import 'package:flutter_demo/page/LoginPage.dart';
import 'package:flutter_demo/page/OrderProcessPage.dart';
import 'package:flutter_demo/page/SplashSreen.dart';
import 'package:flutter_demo/utils/routes.dart';
import 'package:flutter_demo/widget/theme.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      darkTheme: MyTheme.darkTheme(context),
      theme: MyTheme.lightTheme(context),

      home: LoginPage(),
      // initialRoute: MyRoutes.homeRoute,
      routes: {
        MyRoutes.splashRoute: (context) => SplashScreen(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.gridRoute: (context) => GridPage(),
        MyRoutes.cartRoute: ((context) => CartPage()),
        MyRoutes.orderProcessRoute: ((context) => OrderProcessPage()),
        // MyRoutes.productDetailsRoute: (context) => ProductDetailsPage(),
      },
    );
  }
}
