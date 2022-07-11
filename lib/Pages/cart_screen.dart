import 'package:coorgle_test_project/Pages/home_screen.dart';
import 'package:coorgle_test_project/cart/cart_controler.dart';
import 'package:coorgle_test_project/cart/cart_total.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:get/get.dart';

import '../cart/cart_products.dart';

class CartScreen extends StatelessWidget {
  final CartController controller = Get.find();
  CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [Image.asset("assets/ic_search.png")],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CartProducts(),
            CartTotal(),
          ],
        ),

        // bottom navigation bar

        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox(
                width: 2,
              ),
              IconButton(
                icon: Image.asset(
                  "assets/home_icon.png",
                  color: Colors.grey[400],
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.bottomToTop,
                          child: const HomeScreen()));
                },
              ),
              IconButton(
                icon: Image.asset("assets/ic_shop.png"),
                onPressed: () {},
              ),
              IconButton(
                icon: Image.asset("assets/ic_wishlist.png"),
                onPressed: () {},
              ),
              IconButton(
                icon: Image.asset("assets/ic_notif.png"),
                onPressed: () {},
              ),
              const SizedBox(
                width: 2,
              ),
            ],
          ),
        ));
  }
}
