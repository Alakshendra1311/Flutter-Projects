import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_academind/providers/cart.dart';
import 'package:shop_app_academind/providers/product.dart';
import 'package:shop_app_academind/providers/products.dart';
import 'package:shop_app_academind/screens/cart_screen.dart';
import 'package:shop_app_academind/widgets/app_drawer.dart';
import 'package:shop_app_academind/widgets/badge.dart';
import 'package:shop_app_academind/widgets/products_grid.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  //var _isInit = true;

  @override
  void initState() {
    //Provider.of<Products>(context).fetchAndSetProducts(); // Won't work

    // Approach that will work
    Future.delayed(Duration.zero).then((value) {
      Provider.of<Products>(context, listen: false).fetchAndSetProducts();
    });

    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   if (_isInit) {
  //     Provider.of<Products>(context).fetchAndSetProducts();
  //   }
  //   _isInit = false;
  //   super.didChangeDependencies();
  // }

  var _showOnlyFavorites = false;
  final List<Product> loadedProducts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My shop'),
        actions: [
          PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorites) {
                    _showOnlyFavorites = true;
                  } else {
                    _showOnlyFavorites = false;
                  }
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    PopupMenuItem(
                        child: Text('Only Favorites'),
                        value: FilterOptions.Favorites),
                    PopupMenuItem(
                        child: Text('Show All'), value: FilterOptions.All),
                  ]),
          Consumer<Cart>(
            builder: (_, cart, child) => Badge(
              child: child,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
