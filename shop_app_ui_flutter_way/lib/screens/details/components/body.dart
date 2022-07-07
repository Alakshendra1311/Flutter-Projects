import 'package:flutter/material.dart';
import 'package:shop_app_ui_flutter_way/constants.dart';
import 'package:shop_app_ui_flutter_way/models/Product.dart';
import 'package:shop_app_ui_flutter_way/screens/details/components/add_to_cart.dart';
import 'package:shop_app_ui_flutter_way/screens/details/components/color_and_size.dart';
import 'package:shop_app_ui_flutter_way/screens/details/components/counter_with_fav_button.dart';
import 'package:shop_app_ui_flutter_way/screens/details/components/description.dart';
import 'package:shop_app_ui_flutter_way/screens/details/components/product_title_wuth_image.dart';

class Body extends StatelessWidget {
  const Body({Key key, this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  // height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      ColorAndSize(product: product),
                      SizedBox(height: kDefaultPaddin / 2),
                      Description(product: product),
                      SizedBox(height: kDefaultPaddin / 2),
                      CounterWithFavButton(),
                      SizedBox(height: kDefaultPaddin / 2),
                      AddToCart(product: product),
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product),
              ],
            ),
          )
        ],
      ),
    );
  }
}
