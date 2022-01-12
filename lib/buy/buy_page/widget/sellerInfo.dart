import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/buy/buy_page/controller/buy_controller.dart';
import 'package:shopping_app/buy/buy_page/view/seller_items.dart';
import 'package:shopping_app/buy/cart/controller/cart_controller.dart';

class SellerProducts extends StatelessWidget {
  SellerProducts({Key key}) : super(key: key);
  final buyController = Get.put(BuyController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Products")
            .where("productElement", isEqualTo: buyController.item)
            .where("userId", isEqualTo: buyController.id)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (!snapshot.hasData) {
              return const Center(
                child: Text("Check your connection"),
              );
            } else {
              if (snapshot.hasData) {
                return Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 0.75),
                      primary: false,
                      padding: const EdgeInsets.all(15),
                      physics: BouncingScrollPhysics(),
                      itemCount: snapshot.data.size,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            buyController.id =
                                snapshot.data.docs[index]['userId'].toString();
                            buyController.productElement = snapshot
                                .data.docs[index]['productElement']
                                .toString();
                            buyController.itemElement = snapshot
                                .data.docs[index]['itemElement']
                                .toString();
                            buyController.sellerProduct =
                                snapshot.data.docs[index]['Url'][0].toString();
                            cartController.name = snapshot
                                .data.docs[index]['productName']
                                .toString();
                            cartController.size = snapshot
                                .data.docs[index]['productSize']
                                .toString();
                            cartController.price = snapshot
                                .data.docs[index]['otherProductPrice']
                                .toString();
                            cartController.amount = snapshot
                                .data.docs[index]['productAmount']
                                .toString();
                            cartController.description = snapshot
                                .data.docs[index]['otherProductDescription']
                                .toString();
                            print(
                                '>>>>>>>>>>>>>>>${buyController.id},${buyController.productElement},${buyController.itemElement}');
                            Get.to(() => SellerItem());
                          },
                          child: Container(
                            height: Get.height * 0.2,
                            child: Card(
                              child: CachedNetworkImage(
                                cacheManager: buyController.customCacheManager,
                                imageUrl: snapshot.data.docs[index]['Url'][0]
                                    .toString(),
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
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        );
                      }),
                );
              }
            }
            return null;
          } else {
            return Center(child: Text('Loading.....'));
          }
        });
  }
}