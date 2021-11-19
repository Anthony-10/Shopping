import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/buy/buy_page/controller/buy_controller.dart';
import 'package:shopping_app/buy/buy_page/view/seller_account.dart';

class Favourites extends StatefulWidget {
  //final VoidCallback openDrawer;
  //const Favourites({Key? key, required this.openDrawer}) : super(key: key);

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  final buyController = Get.put(BuyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("Favorite")
                .where("uid", isEqualTo: FirebaseAuth.instance.currentUser.uid)
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
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 0.65),
                      primary: false,
                      padding: const EdgeInsets.all(15),
                      physics: BouncingScrollPhysics(),
                      itemCount: snapshot.data.size,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: Get.height * 0.28,
                              width: Get.width * 0.5,
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => SellerAccount());
                                  buyController.name =
                                      snapshot.data.docs[index]['name'];
                                  buyController.id =
                                      snapshot.data.docs[index]['userUid'];
                                  buyController.image =
                                      snapshot.data.docs[index]['image'];
                                },
                                child: Card(
                                  child: Image.network(
                                    snapshot.data.docs[index]['image']
                                        .toString(),
                                    fit: BoxFit.fill,
                                  ),
                                  semanticContainer: true,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  elevation: 20.0,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              snapshot.data.docs[index]['name'].toString(),
                            )
                          ],
                        );
                      },
                    );
                  }
                }
                return null;
              } else {
                return Center(child: Text('Loading.....'));
              }
            }),
      ),
    );
  }
}
