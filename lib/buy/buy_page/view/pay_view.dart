import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/buy/bought/controller/bought_controller.dart';
import 'package:shopping_app/buy/buy_page/controller/buy_controller.dart';
import 'package:shopping_app/buy/cart/controller/cart_controller.dart';
import 'package:shopping_app/core/widget/drawer/drawer_view/drawer_view.dart';
import 'package:shopping_app/sell/add_products/widget/bottom_sheet/color_check_box.dart';

class PayView extends StatefulWidget {
  PayView({Key key}) : super(key: key);

  @override
  State<PayView> createState() => _PayViewState();
}

class _PayViewState extends State<PayView> {
  final boughtController = Get.put(BoughtController());

  final cartController = Get.put(CartController());

  final buyController = Get.put(BuyController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
    getData();
    print('$ehe,llllllllllllllllllll');
  }

  var ehe;
  @override
  Widget build(BuildContext context) {
    print('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
    getData();
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.arrow_back),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: Get.height * .03, left: Get.width * .09),
                  child: Text(
                    'Payment',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ],
            )),
            Padding(
              padding: EdgeInsets.only(
                  top: Get.height * .04,
                  left: Get.width * .05,
                  right: Get.width * .05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      boughtController.boughtInfo(
                          price: cartController.price,
                          size: cartController.size,
                          amount: cartController.amount,
                          image: buyController.sellerProduct,
                          name: cartController.name,
                          sellUid: buyController.id);
                      Get.to(() => DrawerView());
                    },
                    child: Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: Get.width * .05),
                            child: Text(
                              'Cash',
                              style: TextStyle(fontSize: 20),
                            ),
                          )),
                      width: Get.width,
                      height: Get.height * .1,
                      color: Colors.black12,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * .04,
                  ),
                  Container(
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: Get.width * .05),
                          child: Text(
                            'Mpesa',
                            style: TextStyle(fontSize: 20),
                          ),
                        )),
                    width: Get.width,
                    height: Get.height * .1,
                    color: Colors.black12,
                  ),
                  SizedBox(
                    height: Get.height * .09,
                  ),
                  Container(
                    height: Get.height * .4,
                    width: Get.width,
                    color: Colors.red,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> getData() async {
    print('getData');
    try {
      ehe = FirebaseFirestore.instance
          .collection("Products")
          .where("userId", isEqualTo: FirebaseAuth.instance.currentUser.uid)
          .snapshots()
          .length
          .toString();
    } catch (e) {
      print(e);
    }
  }
}
