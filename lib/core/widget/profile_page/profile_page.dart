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
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, right: 10, left: 10),
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
                            buildProfilePick(snapshot, index),
                            SizedBox(
                              height: 30,
                            ),
                            buildProfileTexts(context, snapshot, index)
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

  Column buildProfileTexts(BuildContext context,
      AsyncSnapshot<QuerySnapshot<Object>> snapshot, int index) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: GestureDetector(
            onTap: () => showDialog(
              context: context,
              builder: (context) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: AlertDialog(
                    content: Form(
                      key: _globalKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            validator: (value) {
                              return value.isNotEmpty ? null : "Invalid Field";
                            },
                            key: const ValueKey("Name"),
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              hintText: "Name",
                            ),
                            controller: _email,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      Container(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_globalKey.currentState.validate()) {
                              Navigator.of(context).pop();
                            }
                          },
                          child: Text('Save'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                          ),
                        ),
                      )
                    ]),
              ),
            ),
            child: ListTile(
              leading: Icon(Icons.email),
              title: Text('Name'),
              subtitle: Text(
                snapshot.data.docs[index]['firstName'].toString(),
              ),
              trailing: Icon(Icons.edit),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: GestureDetector(
            onTap: () => showDialog(
              context: context,
              builder: (context) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: AlertDialog(
                    content: Form(
                      key: _globalKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            validator: (value) {
                              return value.isNotEmpty ? null : "Invalid Field";
                            },
                            key: const ValueKey("Email"),
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              hintText: "Email",
                            ),
                            controller: _email,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      Container(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_globalKey.currentState.validate()) {
                              Navigator.of(context).pop();
                            }
                          },
                          child: Text('Save'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                          ),
                        ),
                      )
                    ]),
              ),
            ),
            child: ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text(
                snapshot.data.docs[index]['email'].toString(),
              ),
              trailing: Icon(Icons.edit),
            ),
          ),
        )
      ],
    );
  }

  Stack buildProfilePick(
      AsyncSnapshot<QuerySnapshot<Object>> snapshot, int index) {
    return Stack(
      children: [
        Hero(
          tag: "image_1",
          child: CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 80.0,
              child: ClipOval(
                child: Image.network(
                  drawerFunctions.images =
                      snapshot.data.docs[index]['Url'].toString(),
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
                    addProductsController.bottomIndex = 1;
                    print(
                        '????????????????????????????????????????????????????');
                  });
                  Get.bottomSheet(BottomSheetChose(
                          addProductsController: addProductsController))
                      .whenComplete(
                          () => addProductsController.drawerImage.isNotEmpty
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
    );
  }
}
