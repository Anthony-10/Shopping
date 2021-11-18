import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  const CartView({Key key}) : super(key: key);

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
                                          SizedBox(
                                            height: Get.height * .1,
                                            width: Get.width * .2,
                                            child: Image.network(
                                              snapshot.data.docs[index]['image']
                                                  .toString(),
                                              fit: BoxFit.fill,
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
                                                snapshot
                                                    .data.docs[index]['name']
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
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
                                          SizedBox(
                                            width: Get.width * .17,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
