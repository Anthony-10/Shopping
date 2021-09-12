import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  final drawerFunctions = Get.put(DrawerFunctions());

  final DatabaseService databaseService = Get.put(DatabaseService());
  //final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  final AddProductsController addProductsController =
      Get.put(AddProductsController());

  var me = FirebaseFirestore.instance
      .collection("Users")
      .where("userId", isEqualTo: FirebaseAuth.instance.currentUser.uid);

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

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
      child:
          /*Row(children: [
          Stack(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 50.0,
                child: drawerFunctions.images != null
                    ? Image.network(
                        drawerFunctions.images,
                        fit: BoxFit.fill,
                      )
                    : Icon(
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
                        print(
                            '????????????????????????????????????????????????????');
                      });
                      Get.bottomSheet(BottomSheetChose(
                              addProductsController: addProductsController))
                          .whenComplete(() => addProductsController
                                  .drawerImage.isNotEmpty
                              ? addProductsController.userImage().whenComplete(
                                  () => databaseService.updateUserInfo())
                              : Get.snackbar(
                                  "Error Massage",
                                  'No image Selected',
                                  snackPosition: SnackPosition.BOTTOM,
                                ));
                      print(
                          'OOOOOOOOO BottomSheet OOOOOOOOOOOOO ${drawerFunctions.names} ${drawerFunctions.emails} 0000000000000000');
                    },
                  ))
            ],
          ),
          //drawerFunctions.buildStreamBuilder(),
        ]),*/
          //????????????????????????????????????????????????????????????
          Container(
        height: 100,
        child: FutureBuilder(
            future: me.get(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: Text("Check your connection"),
                  );
                } else {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.size,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    radius: 50.0,
                                    child: ClipOval(
                                      child: Image.network(
                                        snapshot.data.docs[index]['Url']
                                            .toString(),
                                        fit: BoxFit.cover,
                                        width: 100,
                                        height: 100,
                                      ),
                                    )),
                                Positioned(
                                    bottom: -3,
                                    right: -3,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.camera_alt,
                                        size: 30.0,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          addProductsController.bottomIndex = 1;
                                          print(
                                              '????????????????????????????????????????????????????');
                                        });
                                        Get
                                                .bottomSheet(BottomSheetChose(
                                                    addProductsController:
                                                        addProductsController))
                                            .then((drawerImage) =>
                                                addProductsController
                                                        .drawerImage.isNotEmpty
                                                    ? addProductsController
                                                        .userImage()
                                                        .whenComplete(() =>
                                                            databaseService
                                                                .updateUserInfo())
                                                    : Get.snackbar(
                                                        "Error Massage",
                                                        'No image Selected',
                                                        snackPosition:
                                                            SnackPosition
                                                                .BOTTOM,
                                                      ));
                                        print(
                                            'OOOOOOOOO BottomSheet OOOOOOOOOOOOO ${drawerFunctions.names} ${drawerFunctions.emails} 0000000000000000');
                                      },
                                    ))
                              ],
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
                            /*ListTile(
                              title: Text(
                                snapshot.data.docs[index]['firstName']
                                    .toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(snapshot.data.docs[index]['email']
                                  .toString()),
                            )*/
                          ],
                        );
                      },
                    );
                  }
                }
                print(
                    '###############################${snapshot.data.docs}##########################');
                return null;
              } else {
                return Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 50.0,
                      child: Icon(
                        Icons.person,
                        size: 90,
                        color: Colors.grey[800],
                      ),
                    ),
                    Positioned(
                        bottom: -3,
                        right: -3,
                        child: IconButton(
                          icon: Icon(
                            Icons.camera_alt,
                            size: 30.0,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            setState(() {
                              addProductsController.bottomIndex = 1;
                              print(
                                  '????????????????????????????????????????????????????');
                            });
                            Get.bottomSheet(BottomSheetChose(
                                    addProductsController:
                                        addProductsController))
                                .whenComplete(() => addProductsController
                                        .drawerImage.isNotEmpty
                                    ? addProductsController
                                        .userImage()
                                        .whenComplete(() =>
                                            databaseService.updateUserInfo())
                                    : Get.snackbar(
                                        "Error Massage",
                                        'No image Selected',
                                        snackPosition: SnackPosition.BOTTOM,
                                      ));
                            print(
                                'OOOOOOOOO BottomSheet OOOOOOOOOOOOO ${drawerFunctions.names} ${drawerFunctions.emails} 0000000000000000');
                          },
                        ))
                  ],
                );
              }
            }),
      )
      //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

      /* Row(children: [
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
                        print(
                            '????????????????????????????????????????????????????');
                      });
                      Get.bottomSheet(BottomSheetChose(
                              addProductsController: addProductsController))
                          .whenComplete(() => addProductsController
                                  .drawerImage.isNotEmpty
                              ? addProductsController.userImage().whenComplete(
                                  () => addProductsController.fileURL != null
                                      ? databaseService.updateUserInfo()
                                      : addProductsController.userImage())
                              : Get.snackbar(
                                  "Error Massage",
                                  'No image Selected',
                                  snackPosition: SnackPosition.BOTTOM,
                                ));
                      print(
                          'OOOOOOOOOOOOOOOOOOOOOO ${drawerFunctions.name} ${drawerFunctions.gmail} 0000000000000000');
                    },
                  ))
            ],
          ),
          drawerFunctions.buildStreamBuilder(),
           SizedBox(
            height: Get.height * 0.1,
            width: Get.width * 0.5,
            child: ListTile(
              title: Text(
                drawerFunctions.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(drawerFunctions.gmail),
            ),
          )
        ]),*/
      //drawerFunctions.buildStreamBuilder(),
      /*SizedBox(
            height: Get.height * 0.1,
            width: Get.width * 0.5,
            child: ListTile(
              title: Text(
                drawerFunctions.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(drawerFunctions.gmail),
            ),
          )*/
      );
  Future<void> getData() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    try {
      DocumentSnapshot documentSnapshot =
          await FirebaseFirestore.instance.collection('Users').doc(uid).get();
      if (documentSnapshot.exists) {
        setState(() {
          drawerFunctions.images = documentSnapshot.get('Url');
          drawerFunctions.names = documentSnapshot.get('firstName');
          drawerFunctions.emails = documentSnapshot.get('email');
          drawerFunctions.url = documentSnapshot.get('userId');
        });
        print(
            '<<<<<<<<<<<<<<<<<<<<<<<<<<< ${drawerFunctions.images}, ${drawerFunctions.names}, ${drawerFunctions.emails}, ${drawerFunctions.url} >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.');
      } else {
        print('wewe');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<String> userData() async {
    print('<<<<<<<<<<<<<<<<<<<< UserData called >>>>>>>>>>>>>>>>>>>>>>>>');
    String uid = FirebaseAuth.instance.currentUser.uid;
    var snapshot;
    snapshot = FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .snapshots()
        .toList();
    print('&&&&&&&&&&&&&&& UserData &&&&&&&&&&&& $snapshot &&&&&&&&&&&&&&7');
    return snapshot;
  }
}
