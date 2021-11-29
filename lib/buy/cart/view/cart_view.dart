import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/buy/buy_page/controller/buy_controller.dart';
import 'package:shopping_app/buy/buy_page/view/pay_view.dart';

class CartView extends StatelessWidget {
  CartView({Key key}) : super(key: key);
  final buyController = Get.put(BuyController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:
              EdgeInsets.only(top: Get.height * .02, left: Get.width * .03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  child: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(Icons.arrow_back),
              )),
              Padding(
                padding: EdgeInsets.only(left: Get.width * .07),
                child: Container(
                    child: Text(
                  'Cart',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                )),
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("Cart")
                        .where("userId",
                            isEqualTo: FirebaseAuth.instance.currentUser.uid)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: Text("Check your connection"),
                          );
                        } else {
                          if (snapshot.hasData) {
                            return ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount: snapshot.data.size,
                                itemBuilder: (context, index) {
                                  return Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(9.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            height: Get.height * .15,
                                            width: Get.width * .25,
                                            child: Card(
                                              child: CachedNetworkImage(
                                                cacheManager: buyController
                                                    .customCacheManager,
                                                imageUrl: snapshot
                                                    .data.docs[index]['image']
                                                    .toString(),
                                                fit: BoxFit.fill,
                                                placeholder: (context, url) =>
                                                    Container(
                                                  color: Colors.black12,
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Container(
                                                  color: Colors.black12,
                                                  child: Icon(Icons.error,
                                                      color: Colors.red),
                                                ),
                                              ),
                                              semanticContainer: true,
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              elevation: 20.0,
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: Get.width * .15,
                                          ),
                                          Container(
                                            width: Get.width * .2,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  snapshot
                                                      .data.docs[index]['name']
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 17),
                                                ),
                                                SizedBox(
                                                  height: Get.height * .02,
                                                ),
                                                Text(snapshot
                                                    .data.docs[index]['price']
                                                    .toString()),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: Get.width * .15,
                                          ),
                                          Container(
                                            height: Get.height * .15,
                                            width: Get.width * .14,
                                            color: Colors.grey[200],
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: Get.height * .01),
                                                  child: Container(
                                                    height: Get.height * .05,
                                                    width: Get.width * .06,
                                                    color: Colors.grey[100],
                                                    child: Icon(Icons.add),
                                                  ),
                                                ),
                                                Text('23'),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: Get.height * .01),
                                                  child: Container(
                                                    height: Get.height * .05,
                                                    width: Get.width * .06,
                                                    color: Colors.grey[100],
                                                    child: Icon(Icons.remove),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  );
                                });
                          }
                        }
                        return null;
                      } else {
                        return Center(child: Text('Loading.....'));
                      }
                    }),
              ),
              Container(
                height: Get.height * .15,
                width: Get.width,
                color: Colors.grey[200],
                child: Row(
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Cart total',
                            style: TextStyle(fontSize: 17),
                          ),
                          Text(
                            'Tax',
                            style: TextStyle(fontSize: 17),
                          ),
                          Divider(),
                          Text(
                            'Subtotal',
                            style: TextStyle(fontSize: 17),
                          ),
                        ]),
                    SizedBox(
                      width: Get.width * .1,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Ksh 30,000',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold)),
                          Text('Ksh 30,000',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold)),
                          Divider(),
                          Text('Ksh 30,000',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold))
                        ]),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * .04,
              ),
              Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        fixedSize: Size(Get.width * .7, 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    onPressed: () {
                      Get.to(() => PayView());
                    },
                    child: Text('Checkout')),
              ),
              SizedBox(
                height: Get.height * .04,
              )
            ],
          ),
        ),
      ),
    );
  }
}
