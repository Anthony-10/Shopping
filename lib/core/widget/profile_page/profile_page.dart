import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/buy/buy_page/controller/buy_controller.dart';
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
  final buyController = Get.put(BuyController());

  var names;

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
                              },
                            ),
                          ))
                    ],
                  ),
                );
              }
            }),
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
                            controller: _name,
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
                            getData();
                            if (_globalKey.currentState.validate()) {
                              Navigator.of(context).pop();
                            }

                            databaseService.updateUserInfo(
                                firstName: _name.text,
                                email: drawerFunctions.emails,
                                url: drawerFunctions.images);
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
                            getData();
                            if (_globalKey.currentState.validate()) {
                              Navigator.of(context).pop();
                            }
                            databaseService.updateUserInfo(
                                firstName: drawerFunctions.names,
                                email: _email.text,
                                url: drawerFunctions.images);
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
                child: CachedNetworkImage(
                  cacheManager: buyController.customCacheManager,
                  imageUrl: drawerFunctions.images =
                      snapshot.data.docs[index]['Url'].toString(),
                  height: Get.height * .5,
                  width: Get.width * .5,
                  fit: BoxFit.fill,
                  placeholder: (context, url) => Container(
                    color: Colors.black12,
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.black12,
                    child: Icon(Icons.error, color: Colors.red),
                  ),
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
                  getData();
                  setState(() {
                    addProductsController.bottomIndex = 1;
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
                },
              ),
            ))
      ],
    );
  }

  Future<void> getData() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    try {
      DocumentSnapshot documentSnapshot =
          await FirebaseFirestore.instance.collection('Users').doc(uid).get();
      if (documentSnapshot.exists) {
        setState(() {
          drawerFunctions.images =
              documentSnapshot.reference.snapshots().length;
          drawerFunctions.names = documentSnapshot.get('firstName');
          drawerFunctions.emails = documentSnapshot.get('email');
          drawerFunctions.url = documentSnapshot.get('userId');
        });
      } else {
        print('wewe');
      }
    } catch (e) {
      print(e);
    }
  }
}
