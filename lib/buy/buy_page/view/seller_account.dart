import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/buy/buy_page/controller/buy_controller.dart';
import 'package:shopping_app/buy/buy_page/view/location.dart';
import 'package:shopping_app/buy/buy_page/view/seller_items.dart';
import 'package:shopping_app/buy/cart/controller/cart_controller.dart';
import 'package:shopping_app/sell/add_products/controller/addproducts_controller.dart';

class SellerAccount extends StatefulWidget {
  const SellerAccount({Key key}) : super(key: key);

  @override
  _SellerAccountState createState() => _SellerAccountState();
}

class _SellerAccountState extends State<SellerAccount> {
  final buyController = Get.put(BuyController());
  final cartController = Get.put(CartController());
  final addProductsController = Get.put(AddProductsController());
  bool isLiked = false;
  int likeCount;

  var name2;

  var item;
  var color;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  String uid = FirebaseAuth.instance.currentUser.uid;

  @override
  void initState() {
    // TODO: implement initState
    buildIcon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          Container(
            height: Get.height * 0.33,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10, top: 10, right: 10, bottom: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                              onPressed: () => Get.back(),
                              icon: Icon(Icons.arrow_back))),
                      Align(
                        alignment: Alignment.topRight,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  print('2222222222222222');
                                  //TODO
                                  FirebaseFirestore.instance
                                      .collection("Favorite")
                                      .doc(buyController.id)
                                      .collection("currentUser")
                                      .doc(uid)
                                      .get()
                                      .then(
                                          (DocumentSnapshot documentSnapshot) {
                                    if (documentSnapshot.exists) {
                                      buyController.removeFavorite(
                                          image: buyController.image,
                                          name: buyController.name,
                                          userUid: buyController.id);
                                      setState(() {
                                        color = 1;
                                      });
                                      print(
                                          'removeFavorite, ############################################');
                                    } else {
                                      buyController.addFavorite(
                                          image: buyController.image,
                                          name: buyController.name,
                                          userUid: buyController.id);
                                      setState(() {
                                        color = 2;
                                      });
                                      print(
                                          'addFavorite, *******************************************');
                                    }
                                  });
                                },
                                icon: buildIcon()),
                            IconButton(
                                onPressed: () {
                                  Get.to(() => Location());
                                },
                                icon: Icon(Icons.map))
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          buyController.name,
                          style: TextStyle(fontSize: 20),
                        )),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //Changed from stream to future
          StreamBuilder<QuerySnapshot>(
              stream: _fireStore
                  .collection("Products")
                  .where("userId", isEqualTo: buyController.id)
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
                      return Container(
                        height: 80,
                        width: Get.width,
                        child: ListView.builder(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.size,
                          itemBuilder: (BuildContext context, int index) {
                            //removeDuplicat by .toSet
                            final productElement =
                                snapshot.data.docs[index]['productElement'];
                            print(
                                '${snapshot.data.docs[index]['productElement']},9999999999999999999999');

                            return Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      buyController.id =
                                          snapshot.data.docs[index]['userId'];
                                      //TODO
                                      item = productElement;
                                    });
                                    print(
                                        '(((((((((((((((((((${buyController.id}))))))))))))))))))');
                                    print(
                                        '(((((((((((((((((((${buyController.productElement}))))))))))))))))))');
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 90,
                                    child: Center(
                                        child: Text(productElement.toString())),
                                    decoration: BoxDecoration(
                                        color: Colors.grey[400],
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    }
                    print(
                        '###############################$name2##########################');
                  }
                  print(
                      '###############################$name2##########################');
                  return null;
                } else {
                  return Text('Loading......');
                }
              }),
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("Products")
                  .where("productElement", isEqualTo: item)
                  .where("userId", isEqualTo: buyController.id)
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
                      return Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 0.75),
                            primary: false,
                            padding: const EdgeInsets.all(15),
                            physics: BouncingScrollPhysics(),
                            itemCount: snapshot.data.size,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  buyController.id = snapshot
                                      .data.docs[index]['userId']
                                      .toString();
                                  buyController.productElement = snapshot
                                      .data.docs[index]['productElement']
                                      .toString();
                                  buyController.itemElement = snapshot
                                      .data.docs[index]['itemElement']
                                      .toString();
                                  buyController.sellerProduct = snapshot
                                      .data.docs[index]['Url'][0]
                                      .toString();
                                  cartController.name = snapshot
                                      .data.docs[index]['productName']
                                      .toString();
                                  cartController.size = snapshot
                                      .data.docs[index]['productSize']
                                      .toString();
                                  cartController.price = snapshot
                                      .data.docs[index]['otherProductPrice']
                                      .toString();
                                  cartController.amount = snapshot
                                      .data.docs[index]['productAmount']
                                      .toString();
                                  cartController.description = snapshot.data
                                      .docs[index]['otherProductDescription']
                                      .toString();
                                  print(
                                      '>>>>>>>>>>>>>>>${buyController.id},${buyController.productElement},${buyController.itemElement}');
                                  Get.to(() => SellerItem());
                                },
                                child: Container(
                                  height: Get.height * 0.2,
                                  child: Card(
                                    child: CachedNetworkImage(
                                      cacheManager:
                                          buyController.customCacheManager,
                                      imageUrl: snapshot
                                          .data.docs[index]['Url'][0]
                                          .toString(),
                                      fit: BoxFit.fill,
                                      placeholder: (context, url) => Container(
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
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    elevation: 20.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      );
                    }
                  }
                  return null;
                } else {
                  return Center(child: Text('Loading.....'));
                }
              }),
          /*StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("Products")
                  .where("productElement", isEqualTo: item)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {

                return Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 0.75),
                      primary: false,
                      padding: const EdgeInsets.all(15),
                      physics: BouncingScrollPhysics(),
                      itemCount: snapshot.data.size,
                      itemBuilder: (context, index) {
                        return Container(
                          height: Get.height * 0.2,
                          child: Card(
                            child: Image.network(
                              snapshot.data.docs[index]['Url'].toString(),
                              fit: BoxFit.fill,
                            ),
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            elevation: 20.0,
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        );
                      }),
                );
              }),*/
        ]),
      ),
    );
  }

  Icon buildIcon() {
    return Icon(Icons.favorite,
        color: color == 1
            ? Colors.grey
            : color == 2
                ? Colors.red
                : Colors.grey);
  }

  Future favorite({var image, String name}) async {
    try {
      String uid = FirebaseAuth.instance.currentUser.uid;
      dynamic likes;
      bool _isLiked = likes[uid] == true;
      if (_isLiked) {
        setState(() {
          likeCount -= 1;
          isLiked = false;
          likes[uid] = false;
        });
      }
      /*var value = 1;
      DocumentReference documentReference =
          FirebaseFirestore.instance.collection('love').doc(uid);

      return FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(documentReference);

        if (!snapshot.exists) {
          documentReference.set(
              {'love': value});
        }
        int newAmount = snapshot.get('love') + 1;
        transaction.update(documentReference, {'Love': newAmount});
      });*/
    } on FirebaseException catch (e) {
      Get.snackbar(
        "Error Adding User Info",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getData() async {
    try {
      item = FirebaseFirestore.instance
          .collection("Products")
          .where("productElement",
              isEqualTo: "productElement".startsWith("productElement"))
          .snapshots();
    } catch (e) {
      print(e);
    }
  }
}
