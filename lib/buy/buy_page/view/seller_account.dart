import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:shopping_app/buy/buy_page/controller/buy_controller.dart';
import 'package:shopping_app/buy/buy_page/view/seller_items.dart';
import 'package:shopping_app/core/widget/drawer/drawer_view/drawer_view.dart';

class SellerAccount extends StatefulWidget {
  const SellerAccount({Key key}) : super(key: key);

  @override
  _SellerAccountState createState() => _SellerAccountState();
}

class _SellerAccountState extends State<SellerAccount> {
  final buyController = Get.put(BuyController());
  bool isLiked = false;
  int likeCount = 0;

  var name2;

  var item;

  @override
  void initState() {
    // TODO: implement initState
    /*getData();*/
    super.initState();
    print(
        '<<<<<<<<<<<<<<<<<<<<<<<<<<< ${buyController.productElement} >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.');
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
                              onPressed: () => Get.to(DrawerView()),
                              icon: Icon(Icons.arrow_back))),
                      Align(
                        alignment: Alignment.topRight,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.search)),
                            LikeButton(
                              size: 40,
                              isLiked: isLiked,
                              likeCount: likeCount,
                              likeBuilder: (isLiked) {
                                final color = Colors.red;
                                return Icon(
                                  Icons.favorite,
                                  color: color,
                                  size: 25,
                                );
                              },
                            )
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
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
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
                                      item = snapshot.data.docs[index]
                                          ['productElement'];
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
                                        child: Text(snapshot
                                            .data.docs[index]['productElement']
                                            .toString())),
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
                                  buyController.productElement = snapshot
                                      .data.docs[index]['productElement']
                                      .toString();
                                  buyController.itemElement = snapshot
                                      .data.docs[index]['itemElement']
                                      .toString();
                                  buyController.sellerProduct = snapshot
                                      .data.docs[index]['Url'][0]
                                      .toString();

                                  Get.to(() => SellerItem());
                                },
                                child: Container(
                                  height: Get.height * 0.2,
                                  child: Card(
                                    child: Image.network(
                                      snapshot.data.docs[index]['Url'][0]
                                          .toString(),
                                      fit: BoxFit.fill,
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
