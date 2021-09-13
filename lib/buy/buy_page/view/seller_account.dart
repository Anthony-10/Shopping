import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:shopping_app/core/widget/drawer/drawer_view/drawer_view.dart';

class SellerAccount extends StatefulWidget {
  const SellerAccount({Key key}) : super(key: key);

  @override
  _SellerAccountState createState() => _SellerAccountState();
}

class _SellerAccountState extends State<SellerAccount> {
  bool isLiked = false;
  int likeCount = 0;
  String name;
  @override
  void initState() {
    // TODO: implement initState
    getData();
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
              padding: const EdgeInsets.all(8.0),
              child: Column(
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
                  Text(name)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Center(child: Text('sport')),
                  height: 30,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(20)),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Center(child: Text('fashion')),
                  height: 30,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(20)),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Center(child: Text('pets')),
                  height: 30,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(20)),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Center(child: Text('car')),
                  height: 30,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(20)),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Center(child: Text('sport')),
                  height: 30,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(20)),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.75),
                primary: false,
                padding: const EdgeInsets.all(15),
                physics: BouncingScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    height: Get.height * 0.2,
                    child: Card(
                      /*child: Image.network(
                    snapshot.data.docs[index]['Url']
                        .toString(),
                    fit: BoxFit.cover,
                  ),*/
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
          ),
        ]),
      ),
    );
  }

  Future<void> getData() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    try {
      DocumentSnapshot documentSnapshot =
          await FirebaseFirestore.instance.collection('Users').doc(uid).get();
      if (documentSnapshot.exists) {
        setState(() {
          name = documentSnapshot.get('firstName');

          /*drawerFunctions.url = documentSnapshot.get('userId');*/
        });
        print(
            '<<<<<<<<<<<<<<<<<<<<<<<<<<<$name >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.');
      } else {
        print('wewe');
      }
    } catch (e) {
      print(e);
    }
  }
}
