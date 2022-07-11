import 'package:coorgle_test_project/Pages/cart_screen.dart';
import 'package:coorgle_test_project/Pages/detail_screen.dart';
import 'package:coorgle_test_project/cart/cart_controler.dart';
import 'package:coorgle_test_project/product/product_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../utils/my_colors.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Image.asset("assets/ic_menu.png"),
            onPressed: () {},
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                icon: const Icon(Icons.logout_rounded)),
          ],
        ),
        body: ListView.builder(
            itemCount: Product.products.length,
            itemBuilder: ((BuildContext context, index) {
              return ProductCard(index: index);
            })),

        // bottom navigation bar

        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox(
                width: 2,
              ),
              IconButton(
                icon: Image.asset("assets/home_icon.png",
                color:Colors.grey[400],),
                onPressed: () {},
              ),
              IconButton(
                icon: Image.asset("assets/ic_shop.png"),
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.bottomToTop,
                          child: CartScreen()));
                },
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

class ProductCard extends StatelessWidget {
  final cartController = Get.put(CartController());
  final int index;
  ProductCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.9,
      crossAxisCount: 2,
      padding: const EdgeInsets.all(5.0),
      children: Product.products
          .map(
            (e) => Card(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(14.0),
              ),
              elevation: 0,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.leftToRight,
                          child: const DetailScreen()));
                },
                child: Container(
                  margin:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        Product.products[index].image,
                        height: 90,
                        width: double.infinity,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                            text: Product.products[index].type,
                            style: const TextStyle(
                                color: MyColors.myOrange, fontSize: 16.0)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                            text: Product.products[index].name,
                            style: const TextStyle(
                                color: Colors.black87, fontSize: 18.0)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                                text: "\$ ${Product.products[index].price}",
                                style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                          const Spacer(),

                          // add to cart

                          ElevatedButton(
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.black87),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)))),
                              onPressed: () {
                                cartController
                                    .addproduct(Product.products[index]);
                              })
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
          .toList(),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
    );
  }
}

