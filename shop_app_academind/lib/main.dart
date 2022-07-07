import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_academind/providers/cart.dart';
import 'package:shop_app_academind/providers/orders.dart';
import 'package:shop_app_academind/screens/cart_screen.dart';
import 'package:shop_app_academind/screens/edit_product_screen.dart';
import 'package:shop_app_academind/screens/orders_screen.dart';

import 'package:shop_app_academind/screens/product_details_screen.dart';
import 'package:shop_app_academind/screens/user_products_screen.dart';
import 'screens/product_overview_screen.dart';
import './providers/products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailsScreen.routeName: (ctx) => ProductDetailsScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
          UserProductScreen.routeName: (ctx) => UserProductScreen(),
          EditProductScreen.routeName: (ctx) => EditProductScreen(),
        },
      ),
    );
  }
}
