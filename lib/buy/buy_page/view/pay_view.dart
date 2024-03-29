import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/buy/bought/controller/bought_controller.dart';
import 'package:shopping_app/buy/buy_page/controller/buy_controller.dart';
import 'package:shopping_app/buy/cart/controller/cart_controller.dart';
import 'package:shopping_app/core/widget/drawer/drawer_view/drawer_view.dart';

import '../../../core/service/data_base_service.dart';

class PayView extends StatefulWidget {
  PayView({Key key}) : super(key: key);

  @override
  State<PayView> createState() => _PayViewState();
}

class _PayViewState extends State<PayView> {
  final boughtController = Get.put(BoughtController());

  final cartController = Get.put(CartController());

  final buyController = Get.put(BuyController());
  final databaseService = Get.put(DatabaseService());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var ehe;
  @override
  Widget build(BuildContext context) {
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
                      boughtController
                          .boughtInfo(
                              price: cartController.price,
                              size: cartController.size,
                              amount: buyController.counter,
                              image: buyController.sellerProduct,
                              name: cartController.name,
                              sellUid: buyController.id)
                          .then((value) => Get.snackbar(
                              "Success", 'product bought successful',
                              snackPosition: SnackPosition.TOP));

                      ///Displays a notification to the seller
                      databaseService.sendNotification(
                          title: "bought",
                          body: "an item was bought",
                          token: buyController.token);

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
}
