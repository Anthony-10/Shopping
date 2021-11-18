import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Bought")
              .where("sellUid",
                  isEqualTo: FirebaseAuth.instance.currentUser.uid)
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
                                  children: [
                                    Text(snapshot.data.docs[index]['name']
                                        .toString()),
                                    Text(snapshot.data.docs[index]['price']
                                        .toString()),
                                    Text(snapshot.data.docs[index]['size']
                                        .toString())
                                  ],
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
    );
  }
}
