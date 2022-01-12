import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/buy/buy_page/controller/buy_controller.dart';
import 'package:shopping_app/buy/buy_page/view/locations/location.dart';
import 'package:shopping_app/buy/buy_page/widget/sellerCategories.dart';
import 'package:shopping_app/buy/buy_page/widget/sellerInfo.dart';
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

  var color;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  String uid = FirebaseAuth.instance.currentUser.uid;

  @override
  void initState() {
    // TODO: implement initState
    colorFunction();
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
                                      .doc(uid)
                                      .collection("currentUser")
                                      .doc(buyController.id)
                                      .get()
                                      .then(
                                          (DocumentSnapshot documentSnapshot) {
                                    if (documentSnapshot.exists) {
                                      buyController.removeFavorite(
                                          image: buyController.image,
                                          name: buyController.name,
                                          userUid: buyController.id);
                                      setState(() {
                                        color = 0;
                                      });
                                      print(
                                          'removeFavorite, ############################################');
                                    } else {
                                      buyController.addFavorite(
                                          image: buyController.image,
                                          name: buyController.name,
                                          userUid: buyController.id);
                                      setState(() {
                                        color = 1;
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
                          style: TextStyle(fontSize: 25),
                        )),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // The Categories menu
          SellerCategories(),
          // The Products
          SellerProducts(),
        ]),
      ),
    );
  }

  void colorFunction() {
    FirebaseFirestore.instance
        .collection("Favorite")
        .doc(uid)
        .collection("currentUser")
        .doc(buyController.id)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        setState(() {
          color = 1;
        });
      } else {
        setState(() {
          color = 0;
        });
      }
    });
  }

  Icon buildIcon() {
    return Icon(Icons.favorite,
        color: color == 0
            ? Colors.grey
            : color == 1
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
      buyController.item = FirebaseFirestore.instance
          .collection("Products")
          .where("productElement",
              isEqualTo: "productElement".startsWith("productElement"))
          .snapshots();
    } catch (e) {
      print(e);
    }
  }
}
