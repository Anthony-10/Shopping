import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/buy/buy_page/controller/buy_controller.dart';

class BoughtItem extends StatelessWidget {
  BoughtItem({Key key}) : super(key: key);
  final buyController = Get.put(BuyController());

  final bought = FirebaseFirestore.instance
      .collection("Bought")
      .where("userId", isEqualTo: FirebaseAuth.instance.currentUser.uid)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: bought,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                        return FittedBox(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Row(
                                children: [
                                  SizedBox(
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
                                    width: Get.width * .2,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          'Name: ${snapshot.data.docs[index]['name'].toString()}'),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                          'Price: ${snapshot.data.docs[index]['price'].toString()}'),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                          'Size: ${snapshot.data.docs[index]['size'].toString()}'),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                          'Amount: ${snapshot.data.docs[index]['amount'].toString()}'),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                          'Date: ${snapshot.data.docs[index]['date'].toString()}'),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
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
    );
  }
}
