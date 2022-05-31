import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopping_app/buy/buy_page/controller/buy_controller.dart';
import 'package:shopping_app/buy/buy_page/view/seller_image.dart';
import 'package:shopping_app/core/service/data_base_service.dart';

class ProductView extends StatefulWidget {
  ProductView({Key key}) : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final buyController = Get.put(BuyController());
  final databaseService = Get.put(DatabaseService());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    databaseService.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                child: Padding(
              padding:
                  EdgeInsets.only(top: Get.height * .06, left: Get.width * .09),
              child: Text(
                'Products',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            )),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("Products")
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
                          return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 0.65),
                            primary: false,
                            padding: const EdgeInsets.all(15),
                            physics: BouncingScrollPhysics(),
                            itemCount: snapshot.data.size,
                            itemBuilder: (context, index) {
                              print('yyyyyyyyyyyyyyyyyyyyyy');
                              return Column(
                                children: [
                                  SizedBox(
                                    height: Get.height * 0.28,
                                    width: Get.width * 0.5,
                                    child: GestureDetector(
                                      onTap: () {
                                        buyController.image =
                                            snapshot.data.docs[index]['Url'];
                                        buyController.id = snapshot
                                            .data.docs[index]["userId"]
                                            .toString();
                                        buyController.productElement = snapshot
                                            .data.docs[index]['productElement']
                                            .toString();
                                        buyController.itemElement = snapshot
                                            .data.docs[index]['itemElement']
                                            .toString();
                                        Get.defaultDialog(
                                            title: 'Products',
                                            content: SellerImage());
                                        //Get.to(() => ProductItem());
                                      },
                                      child: Card(
                                        child: CachedNetworkImage(
                                          cacheManager:
                                              buyController.customCacheManager,
                                          imageUrl: snapshot
                                              .data.docs[index]['Url'][0]
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
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                      snapshot.data.docs[index]['itemElement']
                                          .toString(),
                                      style: TextStyle(fontSize: 17))
                                ],
                              );
                            },
                          );
                        }
                      }
                      return null;
                    } else {
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1 / 1.8,
                          mainAxisSpacing: 9,
                          crossAxisSpacing: 5,
                          crossAxisCount: 2,
                        ),
                        primary: false,
                        padding: const EdgeInsets.all(15),
                        physics: BouncingScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey[500],
                            highlightColor: Colors.grey[100],
                            child: Container(
                              height: Get.height * 0.9,
                              width: Get.width * 0.5,
                              child: Column(
                                children: [
                                  Container(
                                    height: Get.height * 0.30,
                                    width: Get.width * 0.5,
                                    child: Card(
                                      color: Colors.grey,
                                      semanticContainer: true,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      elevation: 20.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height * .02,
                                  ),
                                  Container(
                                    width: Get.width * 0.3,
                                    child: Container(
                                      height: Get.height * .03,
                                      width: Get.width * .3,
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
