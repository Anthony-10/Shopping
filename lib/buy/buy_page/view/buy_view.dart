import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/buy/buy_page/view/seller_account.dart';
import 'package:shopping_app/buy/data/slide_controller.dart';
import 'package:shopping_app/core/widget/drawer/controller/drawer_controller.dart';
import 'package:shopping_app/sell/data/bottom_sheet/check_box_category.dart';
import 'package:like_button/like_button.dart';
import 'package:shimmer/shimmer.dart';

class BuyView extends StatefulWidget {
  @override
  _BuyViewState createState() => _BuyViewState();
}

class _BuyViewState extends State<BuyView> {
  final controller = SlideController();
  final drawerFunctions = Get.put(DrawerFunctions());

  var me = FirebaseFirestore.instance.collection("Users").snapshots();

  bool isLiked = false;
  int likeCount = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: Get.height * 0.3,
                  width: Get.width,
                  child: PageView.builder(
                      physics: BouncingScrollPhysics(),
                      onPageChanged: controller.selectedPageIndex,
                      itemCount: controller.homePageData.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    controller.homePageData[index].imageAsset),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(20)),
                        );
                      }),
                ),
                Positioned(
                  bottom: 20,
                  right: 150,
                  child: Row(
                      children: List.generate(
                          controller.homePageData.length,
                          (index) => Obx(
                                () => Container(
                                  margin: EdgeInsets.all(4),
                                  height: 12,
                                  width: 12,
                                  decoration: BoxDecoration(
                                      color:
                                          controller.selectedPageIndex.value ==
                                                  index
                                              ? Colors.red
                                              : Colors.white,
                                      shape: BoxShape.circle),
                                ),
                              ))),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SizedBox(
                height: Get.height * 0.06,
                width: Get.width,
                child: TextFormField(
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("Users")
                    .where("userId",
                        isNotEqualTo: FirebaseAuth.instance.currentUser.uid)
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
                        return Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 0.65),
                            primary: false,
                            padding: const EdgeInsets.all(15),
                            physics: BouncingScrollPhysics(),
                            itemCount: snapshot.data.size,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  SizedBox(
                                    height: Get.height * 0.28,
                                    width: Get.width * 0.5,
                                    child: GestureDetector(
                                      onTap: () => Get.to(SellerAccount()),
                                      child: Card(
                                        child: Image.network(
                                          snapshot.data.docs[index]['Url']
                                              .toString(),
                                          fit: BoxFit.fill,
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
                                  ),
                                  Container(
                                    width: Get.width * 0.4,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 20, top: 10),
                                          child: Text(
                                            snapshot
                                                .data.docs[index]['firstName']
                                                .toString(),
                                          ),
                                        ),
                                        LikeButton(
                                          size: 40,
                                          isLiked: isLiked,
                                          likeCount: likeCount,
                                          likeBuilder: (isLiked) {
                                            final color = Colors.red;
                                            return Icon(
                                              Icons.favorite,
                                              color: color,
                                              size: 25,
                                            );
                                          },
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              );
                            },
                          ),
                        );
                      }
                    }
                    return null;
                  } else {
                    return Center(child: Text('Loading.....'));
                  }
                }),
          ],
        ),
      ),
    );
  }
}
