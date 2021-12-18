import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/buy/bought/controller/bought_controller.dart';
import 'package:shopping_app/buy/buy_page/controller/buy_controller.dart';
import 'package:shopping_app/buy/buy_page/view/pay_view.dart';
import 'package:shopping_app/buy/buy_page/view/seller_image.dart';
import 'package:shopping_app/buy/cart/controller/cart_controller.dart';
import 'package:shopping_app/buy/cart/view/cart_view.dart';

class SellerItem extends StatefulWidget {
  const SellerItem({Key key}) : super(key: key);

  @override
  _SellerItemState createState() => _SellerItemState();
}

class _SellerItemState extends State<SellerItem> {
  final buyController = Get.put(BuyController());
  final cartController = Get.put(CartController());
  final boughtController = Get.put(BoughtController());

  final heights = Get.height;
  final widths = Get.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Container(
              height: heights,
              width: widths,
              decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                Colors.indigo[800],
                Colors.indigo[600],
                Colors.indigo[400],
                Colors.indigo[300]
              ])),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () => Get.back(),
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              )),
                          IconButton(
                              onPressed: () {
                                Get.to(() => CartView());
                              },
                              icon: Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                              )),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          buyController.productElement.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          buyController.itemElement.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 40),
                        ),
                      ),
                      /*Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'Price',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),*/
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: heights * .28),
                      child: Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: Colors.indigo[50],
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25.0),
                                topLeft: Radius.circular(25.0))),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: heights * .12,
                              right: widths * .03,
                              left: heights * .03),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Color',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15)),
                                    Container(
                                      height: heights * .03,
                                      width: widths * .2,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 3,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Container(
                                            margin: EdgeInsets.all(4),
                                            height: 10,
                                            width: 12,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.black,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.red,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: widths * .4,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Size',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15)),
                                    Text(
                                      cartController.size,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    )
                                  ],
                                )
                              ]),
                              SizedBox(
                                height: heights * .02,
                              ),
                              Container(
                                height: heights * .13,
                                width: widths,
                                child: SingleChildScrollView(
                                  child: Text(cartController.description),
                                ),
                              ),
                              SizedBox(
                                height: heights * .02,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: heights * .04,
                                        width: widths * .1,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.black,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(70)),
                                        child: Icon(Icons.add),
                                      ),
                                      SizedBox(
                                        width: widths * .03,
                                      ),
                                      Text('23'),
                                      SizedBox(
                                        width: widths * .03,
                                      ),
                                      Container(
                                        height: heights * .04,
                                        width: widths * .1,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.black,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(70)),
                                        child: Icon(Icons.remove),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.favorite))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      cartController.cartInfo(
                                        price: cartController.price,
                                        size: cartController.size,
                                        description: cartController.description,
                                        amount: cartController.amount,
                                        image: buyController.sellerProduct,
                                        name: cartController.name,
                                      );
                                      print('');
                                      Get.to(() => CartView());
                                    },
                                    child: Container(
                                      height: heights * .04,
                                      width: widths * .1,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(70)),
                                      child: Icon(Icons.add_shopping_cart),
                                    ),
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.blue,
                                          fixedSize: Size(widths * .7, 10),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50))),
                                      onPressed: () {
                                        Get.to(() => PayView());
                                      },
                                      child: Text('Buy Now')),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: widths * .07,
              top: heights * .33,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Price',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    height: heights * .02,
                  ),
                  Text(
                    cartController.price,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  )
                ],
              ),
            ),
            Positioned(
                top: heights * .24,
                right: widths * .1,
                child: Container(
                  height: heights * .3,
                  width: widths * .4,
                  child: GestureDetector(
                    onTap: () {
                      print(
                          ',,,,,,,,,,,,,,,,,,,,,,,,,,,,,,${buyController.id}');
                      Get.defaultDialog(
                          title: 'Products', content: SellerImage());
                    },
                    child: Card(
                      child: CachedNetworkImage(
                        cacheManager: buyController.customCacheManager,
                        imageUrl: buyController.sellerProduct,
                        fit: BoxFit.fill,
                        placeholder: (context, url) => Container(
                          color: Colors.black12,
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: Colors.black12,
                          child: Icon(Icons.error, color: Colors.red),
                        ),
                      ),
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 20.0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}