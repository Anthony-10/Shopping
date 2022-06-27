import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/buy/buy_page/controller/buy_controller.dart';

import '../../sell/widget/sell_shimmer_effect.dart';
import '../buy_page/view/seller_account.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                child: Padding(
              padding:
                  EdgeInsets.only(top: Get.height * .06, left: Get.width * .09),
              child: Text(
                'Favourites',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            )),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("Favorite")
                      .doc(FirebaseAuth.instance.currentUser.uid)
                      .collection("currentUser")
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: Text("Check your connection"),
                        );
                      } else {
                        if (snapshot.hasData) {
                          final data = snapshot.data.docs;
                          return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 0.65),
                            primary: false,
                            padding: const EdgeInsets.all(15),
                            physics: BouncingScrollPhysics(),
                            itemCount: data.length,
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
                                            data[index]['name'];
                                        buyController.id =
                                            data[index]['userUid'];
                                        buyController.image =
                                            data[index]['image'];
                                      },
                                      child: Card(
                                        child: CachedNetworkImage(
                                          cacheManager:
                                              buyController.customCacheManager,
                                          imageUrl:
                                              data[index]['image'].toString(),
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
                                    data[index]['name'].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 20),
                                  )
                                ],
                              );
                            },
                          );
                        }
                      }
                      return null;
                    } else {
                      return SellShimmerEffect();
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
