import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/buy/buy_page/controller/buy_controller.dart';
import 'package:shopping_app/buy/buy_page/view/seller_account.dart';

class Favourites extends StatefulWidget {
  //final VoidCallback openDrawer;
  const Favourites({
    Key key,
  }) : super(key: key);

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  final buyController = Get.put(BuyController());
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('Favorite');
  var me;
  String uid = FirebaseAuth.instance.currentUser.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: Get.height * .06, left: Get.width * .09),
                  child: Text(
                    'Favourites',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ],
            )),
            Expanded(
              //Changed from stream to future

              child: FutureBuilder<DocumentSnapshot>(
                  future: FirebaseFirestore.instance
                      .collection("Favorite")
                      .doc(FirebaseAuth.instance.currentUser.uid)
                      .collection("currentUser")
                      .doc()
                      .get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    print(
                        'builder,lllllllllllllllllllllllllllllllllllllllllllllll');
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: Text("Check your connection"),
                        );
                      } else {
                        if (snapshot.hasData) {
                          //print(snapshot.data.length);
                          Map<String, dynamic> data =
                              snapshot.data.data() as Map<String, dynamic>;
                          print(',mmmmmmmmmmmmmmmmmmmmm');
                          return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 0.65),
                            primary: false,
                            padding: const EdgeInsets.all(15),
                            physics: BouncingScrollPhysics(),
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              print(
                                  '${FirebaseAuth.instance.currentUser.uid},,,,,,,,,,,,,,,,,,');
                              print(
                                  '888888888888888888888888888888888888888888');

                              return Column(
                                children: [
                                  SizedBox(
                                    height: Get.height * 0.28,
                                    width: Get.width * 0.5,
                                    child: GestureDetector(
                                      onTap: () {
                                        /*Get.to(() => SellerAccount());
                                        buyController.name =
                                            snapshot.data[index]['name'];
                                        buyController.id =
                                            snapshot.data[index]['userUid'];
                                        buyController.image =
                                            snapshot.data[index]['image'];*/
                                      },
                                      child: Card(
                                        child: CachedNetworkImage(
                                          cacheManager:
                                              buyController.customCacheManager,
                                          imageUrl: data['image'],
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
                                        semanticContainer: true,
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        elevation: 20.0,
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    data['name'],
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
          ],
        ),
      ),
    );
  }
}
