import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/service/data_base_service.dart';
import 'package:shopping_app/sell/models/sell_view_model.dart';

class SellViewCategory extends GetxController {
  /*static var categories;
  static var products;
  static var solds;
  static var orders;
  static var returnsItem;
  static var userid;
  static var users;*/
  static final databaseService = Get.put(DatabaseService());

  static SellViewItems user = SellViewItems(
    label: "Users",
    subtitle: '7',
    icon: Icons.people_outline,
  );
  static SellViewItems categorie = SellViewItems(
    label: "Categories",
    subtitle: '${databaseService.categories}',
    icon: Icons.category,
  );
  static SellViewItems product = SellViewItems(
    label: "Products",
    subtitle: '${databaseService.products}',
    icon: Icons.track_changes,
  );
  static SellViewItems sold = SellViewItems(
    label: "Sold",
    subtitle: '${databaseService.sold}',
    icon: Icons.tag_faces,
  );
  static SellViewItems order = SellViewItems(
    label: "Orders",
    subtitle: '${databaseService.order}',
    icon: Icons.shopping_cart_rounded,
  );
  static SellViewItems returns = SellViewItems(
    label: "Returns",
    subtitle: '${databaseService.returns}',
    icon: Icons.close,
  );

  static final List<SellViewItems> all = [
    user,
    categorie,
    product,
    sold,
    order,
    returns,
  ];

  /*Future<void> getCounterNumber() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    FirebaseFirestore.instance
        .collection("Counter")
        .where('uid', isEqualTo: uid)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        querySnapshot.docs.forEach((doc) {
          categories = doc['categories'];
          products = doc['products'];
          solds = doc['sold'];
          orders = doc['order'];
          returnsItem = doc['returns'];
        });
      } else {
        print(
            'there is no data,llllllllllllllllllllllllllllllllllllllllllllllll');
      }
    });
  }*/
}
