import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  CartView({Key key}) : super(key: key);
  var heights = Get.height;
  var widths = Get.width;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: heights * .02, left: widths * .03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  child: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(Icons.arrow_back),
              )),
              Padding(
                padding: EdgeInsets.only(left: widths * .07),
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
                                            height: heights * .1,
                                            width: widths * .2,
                                            child: Image.network(
                                              snapshot.data.docs[index]['image']
                                                  .toString(),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          SizedBox(
                                            width: widths * .2,
                                          ),
                                          Column(
                                            children: [
                                              Text(snapshot
                                                  .data.docs[index]['name']
                                                  .toString()),
                                              Text(snapshot
                                                  .data.docs[index]['price']
                                                  .toString()),
                                              Text(snapshot
                                                  .data.docs[index]['size']
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
