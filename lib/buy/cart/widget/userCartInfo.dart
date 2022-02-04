import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/buy/buy_page/controller/buy_controller.dart';
import 'package:shopping_app/buy/cart/controller/cart_controller.dart';

class UserCartInfo extends StatefulWidget {
  UserCartInfo({Key key}) : super(key: key);

  @override
  State<UserCartInfo> createState() => _UserCartInfoState();
}

class _UserCartInfoState extends State<UserCartInfo> {
  final buyController = Get.put(BuyController());

  final cartController = Get.put(CartController());

  String uid = FirebaseAuth.instance.currentUser.uid;

  final user = FirebaseFirestore.instance
      .collection("Cart")
      .where('userId', isEqualTo: FirebaseAuth.instance.currentUser.uid)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: user,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    height: Get.height * .15,
                                    width: Get.width * .25,
                                    child: Card(
                                      child: CachedNetworkImage(
                                        cacheManager:
                                            buyController.customCacheManager,
                                        imageUrl: snapshot
                                            .data.docs[index]['image']
                                            .toString(),
                                        fit: BoxFit.fill,
                                        placeholder: (context, url) =>
                                            Container(
                                          color: Colors.black12,
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Container(
                                          color: Colors.black12,
                                          child: Icon(Icons.error,
                                              color: Colors.red),
                                        ),
                                      ),
                                      semanticContainer: true,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
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
                                          'name: ${snapshot.data.docs[index]['name'].toString()}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                        ),
                                        SizedBox(
                                          height: Get.height * .02,
                                        ),
                                        Text(
                                            'price: ${snapshot.data.docs[index]['price'].toString()}'),
                                        SizedBox(
                                          height: Get.height * .02,
                                        ),
                                        Text(
                                            'amount: ${snapshot.data.docs[index]['amount'].toString()}'),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width * .12,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        cartController.sllerId = snapshot
                                            .data.docs[index].reference
                                            .delete();
                                        //TODO
                                        //Adding the numbers even
                                        // when removing the items
                                        cartController.subFunction();
                                      },
                                      icon: Icon(Icons.close)),
                                ],
                              ),
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
        });
  }
}
