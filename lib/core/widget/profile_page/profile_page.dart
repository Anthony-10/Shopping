import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/service/data_base_service.dart';
import 'package:shopping_app/core/widget/bottom_image_selection/bottom_sheet_chose.dart';
import 'package:shopping_app/core/widget/drawer/controller/drawer_controller.dart';
import 'package:shopping_app/sell/add_products/controller/addproducts_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final drawerFunctions = Get.put(DrawerFunctions());
  final DatabaseService databaseService = Get.put(DatabaseService());
  final AddProductsController addProductsController =
      Get.put(AddProductsController());

  @override
  void initState() {
    // TODO: implement initState
    drawerFunctions.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    drawerFunctions.getData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
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
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Hero(
                                  tag: "image_1",
                                  child: CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      radius: 80.0,
                                      child: ClipOval(
                                        child: Image.network(
                                          drawerFunctions.images = snapshot
                                              .data.docs[index]['Url']
                                              .toString(),
                                          fit: BoxFit.cover,
                                          width: 180,
                                          height: 180,
                                        ),
                                      )),
                                ),
                                Positioned(
                                    bottom: -0.1,
                                    right: -0.1,
                                    child: CircleAvatar(
                                      radius: 25,
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.camera_alt,
                                          size: 25.0,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            addProductsController.bottomIndex =
                                                1;
                                            print(
                                                '????????????????????????????????????????????????????');
                                          });
                                          Get.bottomSheet(BottomSheetChose(
                                                  addProductsController:
                                                      addProductsController))
                                              .whenComplete(() =>
                                                  addProductsController
                                                          .drawerImage
                                                          .isNotEmpty
                                                      ? databaseService
                                                          .userImage()
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
                                      ),
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: ListTile(
                                leading: Icon(Icons.person),
                                title: Text(
                                  'Name',
                                ),
                                subtitle: Text(
                                    snapshot.data.docs[index]['firstName']
                                        .toString(),
                                    style: TextStyle(fontSize: 16)),
                                trailing: Icon(Icons.edit),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: ListTile(
                                leading: Icon(Icons.email),
                                title: Text('Email'),
                                subtitle: Text(
                                  snapshot.data.docs[index]['email'].toString(),
                                ),
                                trailing: Icon(Icons.edit),
                              ),
                            )
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
                return Align(
                  alignment: Alignment.topCenter,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 80.0,
                        child: Icon(
                          Icons.person,
                          size: 90,
                          color: Colors.grey[800],
                        ),
                      ),
                      Positioned(
                          bottom: -0.1,
                          right: -0.1,
                          child: CircleAvatar(
                            radius: 25,
                            child: IconButton(
                              icon: Icon(
                                Icons.camera_alt,
                                size: 25.0,
                                color: Colors.white,
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
                                        ? databaseService.userImage()
                                        : Get.snackbar(
                                            "Error Massage",
                                            'No image Selected',
                                            snackPosition: SnackPosition.BOTTOM,
                                          ));

                                print(
                                    'OOOOOOOOO BottomSheet OOOOOOOOOOOOO ${drawerFunctions.names} ${drawerFunctions.emails} 0000000000000000');
                              },
                            ),
                          ))
                    ],
                  ),
                );
              }
            }),
        /*Stack(
              children: [
                Hero(
                  tag: "image_1",
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 80,
                    child: ClipOval(
                      child: Image.network(
                        drawerFunctions.images,
                        fit: BoxFit.cover,
                      ),
                    ),
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
                                addProductsController: addProductsController))
                            .whenComplete(() =>
                                addProductsController.drawerImage.isNotEmpty
                                    ? databaseService.userImage().whenComplete(
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
            ),*/
      ),
    );
  }
}
