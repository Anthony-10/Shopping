/*import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/add_products/view/addproducts_view.dart';
import 'package:shopping_app/buy_page/view/buy_view.dart';
import 'package:shopping_app/core/widget/tab_bar/tab_bar.dart';
import 'package:shopping_app/sell_page/view/sell_view.dart';

class SideViewBuy extends StatefulWidget {
  final int index;

  const SideViewBuy({Key key, this.index}) : super(key: key);

  @override
  _SideViewBuyState createState() => _SideViewBuyState();
}

class _SideViewBuyState extends State<SideViewBuy> {
  double value = 0;
  int index,mainValue=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.indigo, Colors.deepPurple],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter)),
          ),
          SafeArea(
              child: Container(
            width: 200.0,
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                DrawerHeader(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      //backgroundImage: ,
                      backgroundColor: Colors.grey,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('Warren Buffett',
                        style: TextStyle(color: Colors.white))
                  ],
                )),
                *//*Expanded(
                    child: widget.index == 0
                        ? ListView(
                            children: [
                              list_title(function:(){
                                setState(() {
                                  index=1;
                                  mainValue=1;
                                });
                                },name: 'Home Page',),

                              ListTile(
                                onTap: () {
                                  Get.offNamed("favourites");
                                },
                                title: const Text('Favourites',
                                    style: TextStyle(color: Colors.white)),
                                leading: const Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                ),
                              ),
                              ListTile(
                                onTap: () {
                                  Get.offNamed("cart");
                                },
                                title: const Text('Shopping cart',
                                    style: TextStyle(color: Colors.white)),
                                leading: const Icon(
                                  Icons.shopping_cart,
                                  color: Colors.white,
                                ),
                              ),
                              ListTile(
                                onTap: () {
                                  Get.offNamed("bought");
                                },
                                title: const Text('Bought',
                                    style: TextStyle(color: Colors.white)),
                                leading: const Icon(
                                  Icons.shop,
                                  color: Colors.white,
                                ),
                              ),
                              ListTile(
                                onTap: () {
                                  Get.offNamed("favourites");
                                },
                                title: const Text('Try It',
                                    style: TextStyle(color: Colors.white)),
                                leading: const Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                ),
                              ),
                              ListTile(
                                onTap: () {
                                  Get.offNamed("locationBuy");
                                },
                                title: const Text('Location',
                                    style: TextStyle(color: Colors.white)),
                                leading: const Icon(
                                  Icons.map,
                                  color: Colors.white,
                                ),
                              ),
                              const Divider(),
                              ListTile(
                                onTap: () {},
                                title: const Text('Settings',
                                    style: TextStyle(color: Colors.white)),
                                leading: const Icon(Icons.settings),
                              ),
                              ListTile(
                                onTap: () {},
                                title: const Text('About',
                                    style: TextStyle(color: Colors.white)),
                                leading: const Icon(Icons.help),
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 50),
                              ListTile(
                                onTap: () {},
                                title: const Text('log Out',
                                    style: TextStyle(color: Colors.white)),
                                leading: const Icon(Icons.logout),
                              ),
                            ],
                          )
                        : ListView(
                            children: [
                              ListTile(
                                onTap: () {
                                  Get.offNamed("/tab_bar");
                                },
                                title: const Text('Sell Page',
                                    style: TextStyle(color: Colors.white)),
                                leading: const Icon(
                                  Icons.home,
                                  color: Colors.white,
                                ),
                              ),
                              ListTile(
                                onTap: () {
                                  Get.offNamed("profile");
                                },
                                title: const Text('Profile',
                                    style: TextStyle(color: Colors.white)),
                                leading: const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                              ),
                              ListTile(
                                onTap: () {
                                  Get.offNamed("products");
                                },
                                title: const Text('Product',
                                    style: TextStyle(color: Colors.white)),
                                leading: const Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
                              ),
                              ListTile(
                                onTap: () {
                                  Get.offNamed("/add_products_view");
                                },
                                title: const Text('Add products',
                                    style: TextStyle(color: Colors.white)),
                                leading: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                              ListTile(
                                onTap: () {
                                  Get.offNamed("orders");
                                },
                                title: const Text('Orders',
                                    style: TextStyle(color: Colors.white)),
                                leading: const Icon(
                                  Icons.shopping_basket,
                                  color: Colors.white,
                                ),
                              ),
                              ListTile(
                                onTap: () {
                                  Get.offNamed("LocationSell");
                                },
                                title: const Text('Location',
                                    style: TextStyle(color: Colors.white)),
                                leading: const Icon(
                                  Icons.map,
                                  color: Colors.white,
                                ),
                              ),
                              const Divider(),
                              ListTile(
                                onTap: () {},
                                title: const Text('Settings',
                                    style: TextStyle(color: Colors.white)),
                                leading: const Icon(Icons.settings),
                              ),
                              ListTile(
                                onTap: () {},
                                title: const Text('About',
                                    style: TextStyle(color: Colors.white)),
                                leading: const Icon(Icons.help),
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 50),
                              ListTile(
                                onTap: () {},
                                title: const Text('log Out',
                                    style: TextStyle(color: Colors.white)),
                                leading: const Icon(Icons.logout),
                              ),
                            ],
                          ))*//*
              ],
            ),
          )),
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: value),
              duration: Duration(milliseconds: 500),
              builder: (_, double val, __) {
                return (Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      // ..setEntry(3, 2, 0.00)
                      ..setEntry(0, 3, 200 * val)
                      ..rotateY((pi / 20) * val),
                    child: Stack(children: [
                      widget.index == 0 ? GestureDetector(child: BuyView(index: index,value: mainValue,),
                        onHorizontalDragUpdate: (e) {
                          if (e.delta.dx > 0) {
                            setState(() {
                              value = 1;
                            });
                          } else {
                            setState(() {
                              value = 0;
                            });
                          }
                        },) : GestureDetector(child: SellView(),
                        onHorizontalDragUpdate: (e) {
                          if (e.delta.dx > 0) {
                            setState(() {
                              value = 1;
                            });
                          } else {
                            setState(() {
                              value = 0;
                            });
                          }
                        },)
                    ])));
              }),

        ],
      ),
    );
  }
}*/
