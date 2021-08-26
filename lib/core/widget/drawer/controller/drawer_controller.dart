import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerFunctions extends GetxController {
  int initialIndex = 0;

  var name;
  var gmail;

  StreamBuilder<QuerySnapshot<Object>> buildStreamBuilder() {
    //String uid = FirebaseAuth.instance.currentUser.uid;
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("Users")
          .where("userId", isEqualTo: FirebaseAuth.instance.currentUser.uid)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text("Check your connection"),
            );
          } else {
            if (snapshot.hasData) {
              return SizedBox(
                height: Get.height * 0.1,
                width: Get.width * 0.5,
                child: ListView.builder(
                  itemCount: snapshot.data.size,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        name =
                            snapshot.data.docs[index]['firstName'].toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(gmail =
                          snapshot.data.docs[index]['email'].toString()),
                    );
                  },
                ),
              );
            }
          }
          return null;
        } else {
          return const Center(
            child: Text("loading..."),
          );
        }
      },
    );
  }
}
