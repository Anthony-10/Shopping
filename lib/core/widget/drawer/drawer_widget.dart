import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/buy/data/buy_drawer/buy_item.dart';
import 'package:shopping_app/core/service/data_base_service.dart';
import 'package:shopping_app/core/widget/bottom_image_selection/bottom_sheet_chose.dart';
import 'package:shopping_app/core/widget/drawer/controller/drawer_controller.dart';
import 'package:shopping_app/sell/add_products/controller/addproducts_controller.dart';
import 'package:shopping_app/sell/data/sell_drawer/sell_item.dart';
import 'package:shopping_app/sell/models/drawer_model.dart';

class DrawerWidget extends StatefulWidget {
  final ValueChanged<DrawerItem> onSelectedItem;

  DrawerWidget({
    Key key,
    this.onSelectedItem,
  }) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final initialindex = Get.put(InitialIndex());

  final DatabaseService databaseService = Get.put(DatabaseService());
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  final AddProductsController addProductsController =
      Get.put(AddProductsController());

  var name;
  var gmail;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 32, 16, 0),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCircleAvatar(context),
            buildDrawerItems(context),
          ],
        ),
      ),
    );
  }

  buildDrawerItems(BuildContext context) => Column(
      children: initialindex.initialIndex == 0
          ? BuyDrawerItems.all
              .map((item) => ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                    leading: Icon(
                      item.icon,
                      color: Colors.black,
                    ),
                    title: Text(
                      item.title,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    onTap: () => widget.onSelectedItem(item),
                  ))
              .toList()
          : SellDrawerItems.all
              .map((item) => ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                    leading: Icon(
                      item.icon,
                      color: Colors.black,
                    ),
                    title: Text(
                      item.title,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    onTap: () => widget.onSelectedItem(item),
                  ))
              .toList());

  buildCircleAvatar(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 20.0),
        child: Row(children: [
          Stack(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 50.0,
                child: Icon(
                  Icons.person,
                  size: Get.height * 0.1,
                ),
              ),
              Positioned(
                  bottom: -3,
                  right: -3,
                  child: IconButton(
                    icon: Icon(
                      Icons.camera_alt,
                      size: 30.0,
                    ),
                    onPressed: () {
                      setState(() {
                        addProductsController.bottomIndex = 1;
                      });
                      Get.bottomSheet(BottomSheetChose(
                              addProductsController: addProductsController))
                          .whenComplete(() => addProductsController
                                  .drawerImage.isNotEmpty
                              ? addProductsController.userImage().whenComplete(
                                  () => databaseService.updateUserInfo(
                                      email: gmail, firstName: name))
                              : Get.snackbar(
                                  "Error Massage",
                                  'No image Selected',
                                  snackPosition: SnackPosition.BOTTOM,
                                ));
                    },
                  ))
            ],
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("Users")
                .where("userId",
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
                    return SizedBox(
                      height: Get.height * 0.1,
                      width: Get.width * 0.5,
                      child: ListView.builder(
                        itemCount: snapshot.data.size,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              name = snapshot.data.docs[index]['firstName']
                                  .toString(),
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
          ),
        ]),
      );
}
