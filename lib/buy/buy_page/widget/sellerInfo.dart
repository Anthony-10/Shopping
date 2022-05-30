import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopping_app/buy/buy_page/controller/buy_controller.dart';
import 'package:shopping_app/buy/buy_page/view/seller_items.dart';
import 'package:shopping_app/buy/cart/controller/cart_controller.dart';

class SellerProducts extends StatefulWidget {
  SellerProducts({Key key}) : super(key: key);

  @override
  State<SellerProducts> createState() => _SellerProductsState();
}

class _SellerProductsState extends State<SellerProducts> {
  final buyController = Get.put(BuyController());

  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    print(
        '${buyController.item.value}>>>>>>>>>>>>>>>>>>SellerProducts<<<<<<<<<<<<<<<<<u');
    return Obx(() {
      print(
          '${buyController.item.value}>>>>>>>>>>>>>>>>>>SellerProducts<<<<<<<<<<<<<<<<<mmm');
      return StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Products")
              .where("productElement", isEqualTo: buyController.item.value)
              .where("userId", isEqualTo: buyController.id)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (!snapshot.hasData) {
                return const Center(
                  child: Text("Check your connection"),
                );
              } else {
                if (snapshot.hasData) {
                  print(
                      '${buyController.item.value}>>>>>>>>>>>>>>>>>>SellerProducts<<<<<<<<<<<<<<<<99999999');
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
                              buyController.image =
                                  snapshot.data.docs[index]['Url'];
                              buyController.id = snapshot
                                  .data.docs[index]['userId']
                                  .toString();
                              buyController.productElement = snapshot
                                  .data.docs[index]['productElement']
                                  .toString();
                              buyController.itemElement = snapshot
                                  .data.docs[index]['itemElement']
                                  .toString();
                              buyController.sellerProduct = snapshot
                                  .data.docs[index]['Url'][0]
                                  .toString();
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
                                  '>>>>>>>>>>>>>>>${buyController.id},${buyController.productElement},${buyController.itemElement},${buyController.image}');
                              Get.to(() => SellerItem());
                            },
                            child: Container(
                              height: Get.height * 0.2,
                              child: Card(
                                child: CachedNetworkImage(
                                  cacheManager:
                                      buyController.customCacheManager,
                                  imageUrl: snapshot.data.docs[index]['Url'][0]
                                      .toString(),
                                  fit: BoxFit.fill,
                                  placeholder: (context, url) => Container(
                                    color: Colors.black12,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Container(
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
              return Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 0.75),
                    primary: false,
                    padding: const EdgeInsets.all(15),
                    physics: BouncingScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey[500],
                        highlightColor: Colors.grey[100],
                        child: Container(
                          height: Get.height * 0.2,
                          child: Card(
                            /* child: CachedNetworkImage(
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
                            ),*/
                            color: Colors.grey,
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
          });
    });
  }
}
