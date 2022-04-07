import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopping_app/buy/buy_page/controller/buy_controller.dart';
import 'package:shopping_app/buy/buy_page/view/seller_account.dart';

class UserStaff extends StatelessWidget {
  //const UserStaff({Key key}) : super(key: key);
  final buyController = Get.put(BuyController());

  final user = FirebaseFirestore.instance
      .collection("Users")
      .where("userId", isNotEqualTo: FirebaseAuth.instance.currentUser.uid)
      /*.orderBy('distances')*/
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
                return Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1 / 1.8,
                      mainAxisSpacing: 9,
                      crossAxisSpacing: 5,
                      crossAxisCount: 2,
                    ),
                    primary: false,
                    padding: const EdgeInsets.all(15),
                    physics: BouncingScrollPhysics(),
                    itemCount: snapshot.data.size,
                    itemBuilder: (context, index) {
                      return Container(
                        height: Get.height * 0.9,
                        width: Get.width * 0.5,
                        child: Column(
                          children: [
                            Container(
                              height: Get.height * 0.30,
                              width: Get.width * 0.5,
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => SellerAccount());
                                  buyController.name =
                                      snapshot.data.docs[index]['firstName'];
                                  buyController.id =
                                      snapshot.data.docs[index]['userId'];
                                  buyController.image =
                                      snapshot.data.docs[index]['Url'];
                                  print(
                                      'ttttttttttttttttt,${buyController.id}');
                                  print(
                                      'ttttttttttttttttt,${buyController.image}');
                                },
                                child: Card(
                                  child: CachedNetworkImage(
                                    cacheManager:
                                        buyController.customCacheManager,
                                    imageUrl: snapshot.data.docs[index]['Url']
                                        .toString(),
                                    fit: BoxFit.fill,
                                    //maxHeightDiskCache: 75,
                                    placeholder: (context, url) => Container(
                                      color: Colors.black12,
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Container(
                                      color: Colors.black12,
                                      child:
                                          Icon(Icons.error, color: Colors.red),
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
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: Get.width * 0.3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data.docs[index]['firstName']
                                        .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '30',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Icon(Icons.favorite),
                                      ])
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
            }
            return null;
          } else {
            return Expanded(
              child: GridView.builder(
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
                              /* child: CachedNetworkImage(
                                cacheManager:
                                    buyController.customCacheManager,
                                imageUrl: snapshot.data.docs[index]['Url']
                                    .toString(),
                                fit: BoxFit.fill,
                                //maxHeightDiskCache: 75,
                                placeholder: (context, url) => Container(
                                  color: Colors.black12,
                                ),
                                errorWidget: (context, url, error) =>
                                    Container(
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
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: Get.width * 0.3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 10,
                                  width: Get.width * .1,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '30',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Icon(Icons.favorite),
                                    ])
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        });
  }
}
