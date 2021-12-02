import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/buy/buy_page/controller/buy_controller.dart';
import 'package:shopping_app/buy/data/buy_drawer/buy_item.dart';
import 'package:shopping_app/core/service/data_base_service.dart';
import 'package:shopping_app/core/widget/drawer/controller/drawer_controller.dart';
import 'package:shopping_app/core/widget/profile_page/profile_page.dart';
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
  final drawerFunctions = Get.put(DrawerFunctions());

  final DatabaseService databaseService = Get.put(DatabaseService());

  final AddProductsController addProductsController =
      Get.put(AddProductsController());
  final buyController = Get.put(BuyController());

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
      children: drawerFunctions.initialIndex == 0
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
      child: Container(
        height: 100,
        child: StreamBuilder<QuerySnapshot>(
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
                    return ListView.builder(
                      itemCount: snapshot.data.size,
                      itemBuilder: (context, index) {
                        return SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  drawerFunctions.images =
                                      snapshot.data.docs[index]['Url'];
                                  drawerFunctions.names =
                                      snapshot.data.docs[index]['firstName'];
                                  Get.to(ProfilePage());
                                  print(
                                      'xxxxxxxxx${drawerFunctions.images}, ${drawerFunctions.names}');
                                },
                                child: Hero(
                                  tag: "image_1",
                                  child: CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      radius: 50.0,
                                      child: ClipOval(
                                        child: CachedNetworkImage(
                                          cacheManager:
                                              buyController.customCacheManager,
                                          imageUrl: drawerFunctions.images =
                                              snapshot.data.docs[index]['Url']
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
                                      )),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(children: [
                                Text(
                                    snapshot.data.docs[index]['firstName']
                                        .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                Text(
                                  snapshot.data.docs[index]['email'].toString(),
                                ),
                              ])
                            ],
                          ),
                        );
                      },
                    );
                  }
                }
                print(
                    '###############################${snapshot.data.docs}##########################');
                return null;
              } else {
                return CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 50.0,
                  child: Icon(
                    Icons.person,
                    size: 90,
                    color: Colors.grey[800],
                  ),
                );
              }
            }),
      ));
}
