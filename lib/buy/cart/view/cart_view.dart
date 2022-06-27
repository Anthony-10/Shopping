import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/buy/buy_page/controller/buy_controller.dart';
import 'package:shopping_app/buy/buy_page/view/pay_view.dart';
import 'package:shopping_app/buy/buy_page/view/seller_account.dart';
import 'package:shopping_app/buy/cart/controller/cart_controller.dart';
import 'package:shopping_app/buy/cart/widget/userCartInfo.dart';

class CartView extends StatefulWidget {
  CartView({Key key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final buyController = Get.put(BuyController());

  final cartController = Get.put(CartController());

  @override
  void initState() {
    // TODO: implement initState
    cartController.sumFunction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
              top: Get.height * .02,
              left: Get.width * .03,
              right: Get.width * .03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  child: IconButton(
                onPressed: () => Get.to(() => SellerAccount()),
                icon: Icon(Icons.arrow_back),
              )),
              Padding(
                padding: EdgeInsets.only(
                    left: Get.width * .07, bottom: Get.height * .02),
                child: Container(
                    child: Text(
                  'Cart',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                )),
              ),
              Expanded(
                child: UserCartInfo(),
              ),
              Container(
                height: Get.height * .15,
                width: Get.width,
                color: Colors.grey[200],
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: Get.width * .05),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Cart total',
                              style: TextStyle(fontSize: 17),
                            ),
                            /*Text(
                              'Tax',
                              style: TextStyle(fontSize: 17),
                            ),
                            Divider(),
                            Text(
                              'Subtotal',
                              style: TextStyle(fontSize: 17),
                            ),*/
                          ]),
                    ),
                    SizedBox(
                      width: Get.width * .1,
                    ),
                    Obx(
                      () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Ksh ${cartController.sum.value}',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                            /*Text('Ksh 30,000',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                            Divider(),
                            Text('Ksh 30,000',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold))*/
                          ]),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * .04,
              ),
              Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        fixedSize: Size(Get.width * .7, 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    onPressed: () {
                      cartController.deleteCartInfo();
                      Get.to(() => PayView());
                    },
                    child: Text('Checkout')),
              ),
              SizedBox(
                height: Get.height * .04,
              )
            ],
          ),
        ),
      ),
    );
  }
}
