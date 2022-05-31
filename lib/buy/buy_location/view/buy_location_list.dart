import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopping_app/buy/buy_page/controller/buy_controller.dart';

import 'buyer_location.dart';

class BuyLocationList extends StatelessWidget {
  BuyLocationList({Key key}) : super(key: key);

  final buyController = Get.put(BuyController());

  final user = FirebaseFirestore.instance
      .collection("location")
      .where('uid', isNotEqualTo: FirebaseAuth.instance.currentUser.uid)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () => Get.to(BuyerLocation()),
                    icon: Icon(Icons.map),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: Get.height * .03, left: Get.width * .09),
                  child: Text(
                    'Location List',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ],
            )),
            SizedBox(
              height: Get.height * .03,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: user,
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
                                return FittedBox(
                                  child: SizedBox(
                                    width: Get.width,
                                    height: Get.height * .2,
                                    child: Card(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          top: Get.height * .02,
                                          left: Get.width * .05,
                                          bottom: Get.height * .02,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'country: ${snapshot.data.docs[index]['Country'].toString()}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17),
                                            ),
                                            Text(
                                              'address: ${snapshot.data.docs[index]['Address'].toString()}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17),
                                            ),
                                            Text(
                                              'postalCode: ${snapshot.data.docs[index]['postalCode'].toString()}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17),
                                            ),
                                          ],
                                        ),
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                );
                              });
                        }
                      }
                      return null;
                    } else {
                      return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey[500],
                              highlightColor: Colors.grey[100],
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(9.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            height: Get.height * .15,
                                            width: Get.width * .25,
                                            child: Card(
                                              semanticContainer: true,
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              elevation: 20.0,
                                              color: Colors.grey,
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
                                                Container(
                                                  height: Get.height * .01,
                                                  width: Get.width * .3,
                                                  color: Colors.grey,
                                                ),
                                                SizedBox(
                                                  height: Get.height * .02,
                                                ),
                                                Container(
                                                  height: Get.height * .01,
                                                  width: Get.width * .3,
                                                  color: Colors.grey,
                                                ),
                                                SizedBox(
                                                  height: Get.height * .02,
                                                ),
                                                Container(
                                                  height: Get.height * .01,
                                                  width: Get.width * .3,
                                                  color: Colors.grey,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
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
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
