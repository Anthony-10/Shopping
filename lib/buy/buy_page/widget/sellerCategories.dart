import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/buy/buy_page/controller/buy_controller.dart';

class SellerCategories extends StatefulWidget {
  SellerCategories({Key key}) : super(key: key);

  @override
  State<SellerCategories> createState() => _SellerCategoriesState();
}

class _SellerCategoriesState extends State<SellerCategories> {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  final buyController = Get.put(BuyController());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _fireStore
            .collection("Categories")
            .where("userId", isEqualTo: buyController.id)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                      final categories = snapshot.data.docs[index]['Item'];
                      print(
                          '${snapshot.data.docs[index]['Item']},9999999999999999999999');

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
                                buyController.item = categories;
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
                                  child: Text(categories.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17))),
                              decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              }
              /*print(
                  '###############################$name2##########################');*/
            }
            /*print(
                '###############################$name2##########################');*/
            return null;
          } else {
            return Text('Loading......');
          }
        });
  }
}